import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carai/core/constants/app_constants.dart';
import 'package:carai/core/router/router_provider.dart';
import 'package:carai/core/utils/global_keys.dart';
import 'package:carai/design_system/foundations/app_colors.dart';
import 'package:carai/features/auth/presentation/providers/token_refresh_manager.dart';

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.stylus,
  };
}

class CaraiApp extends ConsumerWidget {
  const CaraiApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final tokenRefreshState = ref.watch(tokenRefreshManagerProvider);

    return MaterialApp.router(
      title: 'Carai 문서 스캐너',
      scrollBehavior: AppScrollBehavior(),
      scaffoldMessengerKey: scaffoldMessengerKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          surface: AppColors.backgroundDark,
        ),
        scaffoldBackgroundColor: AppColors.backgroundDark,
        canvasColor: AppColors.backgroundDark,
        useMaterial3: true,
      ),
      routerConfig: router,
      // Show loading overlay during token refresh
      builder: (context, child) {
        final content = tokenRefreshState.when(
          data: (_) => child ?? const SizedBox(),
          loading: () => const Scaffold(
            backgroundColor: AppColors.backgroundDark,
            body: Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
          ),
          error: (error, stackTrace) => child ?? const SizedBox(),
        );

        final isMobile =
            defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.android;

        if (isMobile) {
          return content;
        }

        return ColoredBox(
          color: AppColors.textLight,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: AppConstants.mobileMaxWidth,
              ),
              child: content,
            ),
          ),
        );
      },
    );
  }
}
