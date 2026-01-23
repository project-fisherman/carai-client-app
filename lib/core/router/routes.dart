import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/registration_screen.dart';
import '../../features/dashboard/presentation/screens/mechanic_dashboard_screen.dart';

part 'routes.g.dart';

@TypedGoRoute<DashboardRoute>(path: '/')
class DashboardRoute extends GoRouteData {
  const DashboardRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MechanicDashboardScreen();
  }
}

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginScreen();
  }
}

@TypedGoRoute<RegistrationRoute>(path: '/signup')
class RegistrationRoute extends GoRouteData {
  const RegistrationRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const RegistrationScreen();
  }
}

// Keeping other existing routes as placeholders
@TypedGoRoute<DocumentRoute>(path: '/document')
class DocumentRoute extends GoRouteData {
  const DocumentRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    // Placeholder until the actual screen is implemented
    return const Scaffold(body: Center(child: Text('Document Screen')));
  }
}

@TypedGoRoute<SuccessRoute>(path: '/success')
class SuccessRoute extends GoRouteData {
  const SuccessRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Scaffold(body: Center(child: Text('Success!')));
  }
}
