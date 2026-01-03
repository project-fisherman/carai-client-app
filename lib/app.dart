import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carai/core/router/router_provider.dart';
import 'package:carai/core/utils/global_keys.dart';
import 'package:carai/design_system/foundations/app_colors.dart';

class CaraiApp extends ConsumerWidget {
  const CaraiApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Carai Document Scanner',
      scaffoldMessengerKey: scaffoldMessengerKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          background: AppColors.backgroundLight,
          surface: AppColors.backgroundLight,
        ),
        scaffoldBackgroundColor: AppColors.backgroundLight,
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
