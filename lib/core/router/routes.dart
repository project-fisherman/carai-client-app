import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/providers/auth_notifier.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/registration_screen.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/',
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to Carai!'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ref.read(authNotifierProvider.notifier).logout();
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}

@TypedGoRoute<LoginRoute>(
  path: '/login',
)
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginScreen();
  }
}

@TypedGoRoute<RegistrationRoute>(
  path: '/signup',
)
class RegistrationRoute extends GoRouteData {
  const RegistrationRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const RegistrationScreen();
  }
}

// Keeping other existing routes as placeholders
@TypedGoRoute<DocumentRoute>(
  path: '/document',
)
class DocumentRoute extends GoRouteData {
  const DocumentRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
     // Placeholder until the actual screen is implemented
    return const Scaffold(body: Center(child: Text('Document Screen')));
  }
}

@TypedGoRoute<SuccessRoute>(
  path: '/success',
)
class SuccessRoute extends GoRouteData {
  const SuccessRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Scaffold(body: Center(child: Text('Success!')));
  }
}
