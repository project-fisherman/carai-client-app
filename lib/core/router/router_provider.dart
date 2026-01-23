import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../features/auth/presentation/providers/auth_notifier.dart';
import 'routes.dart';
import '../utils/global_keys.dart';

part 'router_provider.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final authState = ref.watch(authNotifierProvider);

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: const DashboardRoute().location,
    routes: $appRoutes,
    redirect: (context, state) {
      if (authState.isLoading || authState.hasError) {
        return null; // Handle loading/error appropriately, maybe stay on splash
      }

      final isLoggedIn = authState.value != null;
      final isLoggingIn = state.uri.path == const LoginRoute().location;
      final isSigningUp = state.uri.path == const RegistrationRoute().location;

      if (!isLoggedIn && !isLoggingIn && !isSigningUp) {
        return const LoginRoute().location;
      }

      if (isLoggedIn && isLoggingIn) {
        return const DashboardRoute().location;
      }

      return null;
    },
  );
}
