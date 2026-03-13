import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/auth/data/datasources/auth_local_data_source.dart';
import '../../features/auth/presentation/providers/auth_notifier.dart';
import '../../features/auth/presentation/providers/token_refresh_manager.dart';
import '../../features/mechanic_dashboard/presentation/providers/invitation_provider.dart';
import 'routes.dart';
import '../utils/global_keys.dart';

part 'router_provider.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final authState = ref.watch(authNotifierProvider);
  final authLocalDataSource = ref.watch(authLocalDataSourceProvider);
  final tokenRefreshState = ref.watch(tokenRefreshManagerProvider);

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: const MainRoute().location,
    routes: $appRoutes,
    redirect: (context, state) {
      if (state.uri.path.startsWith('/invites/')) {
        final token = state.pathParameters['token'];
        if (token != null) {
          ref.read(invitationStateProvider.notifier).saveToken(token);
        }
        return const MainRoute().location;
      }

      // Wait for token refresh to complete
      if (tokenRefreshState.isLoading) {
        debugPrint('⏳ [Router] Token refresh in progress, waiting...');
        return null; // Stay on current route while refreshing
      }

      if (authState.isLoading || authState.hasError) {
        return null; // Handle loading/error appropriately, maybe stay on splash
      }

      // Check both user state AND token existence to ensure login is fully complete
      final hasUser = authState.value != null;
      final hasToken = authLocalDataSource.getAccessToken() != null;
      final isLoggedIn = hasUser && hasToken;

      final isLoggingIn = state.uri.path == const LoginRoute().location;
      final isSigningUp = state.uri.path == const RegistrationRoute().location;

      if (!isLoggedIn && !isLoggingIn && !isSigningUp) {
        return const LoginRoute().location;
      }

      if (isLoggedIn && isLoggingIn) {
        return const MainRoute().location;
      }

      return null;
    },
  );
}
