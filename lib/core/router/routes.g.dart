// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $dashboardRoute,
      $loginRoute,
      $registrationRoute,
      $myPageRoute,
      $documentRoute,
      $successRoute,
    ];

RouteBase get $dashboardRoute => GoRouteData.$route(
      path: '/',
      factory: $DashboardRouteExtension._fromState,
    );

extension $DashboardRouteExtension on DashboardRoute {
  static DashboardRoute _fromState(GoRouterState state) =>
      const DashboardRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginRoute => GoRouteData.$route(
      path: '/login',
      factory: $LoginRouteExtension._fromState,
    );

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  String get location => GoRouteData.$location(
        '/login',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $registrationRoute => GoRouteData.$route(
      path: '/signup',
      factory: $RegistrationRouteExtension._fromState,
    );

extension $RegistrationRouteExtension on RegistrationRoute {
  static RegistrationRoute _fromState(GoRouterState state) =>
      const RegistrationRoute();

  String get location => GoRouteData.$location(
        '/signup',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $myPageRoute => GoRouteData.$route(
      path: '/mypage',
      factory: $MyPageRouteExtension._fromState,
    );

extension $MyPageRouteExtension on MyPageRoute {
  static MyPageRoute _fromState(GoRouterState state) => const MyPageRoute();

  String get location => GoRouteData.$location(
        '/mypage',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $documentRoute => GoRouteData.$route(
      path: '/document',
      factory: $DocumentRouteExtension._fromState,
    );

extension $DocumentRouteExtension on DocumentRoute {
  static DocumentRoute _fromState(GoRouterState state) => const DocumentRoute();

  String get location => GoRouteData.$location(
        '/document',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $successRoute => GoRouteData.$route(
      path: '/success',
      factory: $SuccessRouteExtension._fromState,
    );

extension $SuccessRouteExtension on SuccessRoute {
  static SuccessRoute _fromState(GoRouterState state) => const SuccessRoute();

  String get location => GoRouteData.$location(
        '/success',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
