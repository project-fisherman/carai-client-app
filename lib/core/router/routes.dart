import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/',
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    // Placeholder until the actual screen is implemented
    return const Scaffold(body: Center(child: Text('Home Screen')));
  }
}

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
