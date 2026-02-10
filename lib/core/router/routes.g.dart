// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $mainRoute,
      $loginRoute,
      $registrationRoute,
      $myPageRoute,
      $documentRoute,
      $createShopRoute,
      $successRoute,
      $changePasswordRoute,
      $mechanicDashboardRoute,
      $checklistSelectionRoute,
      $manageWorkshopRoute,
    ];

RouteBase get $mainRoute => GoRouteData.$route(
      path: '/',
      factory: $MainRouteExtension._fromState,
    );

extension $MainRouteExtension on MainRoute {
  static MainRoute _fromState(GoRouterState state) => const MainRoute();

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
      path: '/document/:shopId',
      factory: $DocumentRouteExtension._fromState,
    );

extension $DocumentRouteExtension on DocumentRoute {
  static DocumentRoute _fromState(GoRouterState state) => DocumentRoute(
        shopId: state.pathParameters['shopId']!,
      );

  String get location => GoRouteData.$location(
        '/document/${Uri.encodeComponent(shopId)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $createShopRoute => GoRouteData.$route(
      path: '/create-shop',
      factory: $CreateShopRouteExtension._fromState,
    );

extension $CreateShopRouteExtension on CreateShopRoute {
  static CreateShopRoute _fromState(GoRouterState state) =>
      const CreateShopRoute();

  String get location => GoRouteData.$location(
        '/create-shop',
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

RouteBase get $changePasswordRoute => GoRouteData.$route(
      path: '/change-password',
      factory: $ChangePasswordRouteExtension._fromState,
    );

extension $ChangePasswordRouteExtension on ChangePasswordRoute {
  static ChangePasswordRoute _fromState(GoRouterState state) =>
      const ChangePasswordRoute();

  String get location => GoRouteData.$location(
        '/change-password',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $mechanicDashboardRoute => GoRouteData.$route(
      path: '/mechanic-dashboard/:shopId',
      factory: $MechanicDashboardRouteExtension._fromState,
    );

extension $MechanicDashboardRouteExtension on MechanicDashboardRoute {
  static MechanicDashboardRoute _fromState(GoRouterState state) =>
      MechanicDashboardRoute(
        shopId: state.pathParameters['shopId']!,
        checklistCount: _$convertMapValue(
            'checklist-count', state.uri.queryParameters, int.parse),
      );

  String get location => GoRouteData.$location(
        '/mechanic-dashboard/${Uri.encodeComponent(shopId)}',
        queryParams: {
          if (checklistCount != null)
            'checklist-count': checklistCount!.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}

RouteBase get $checklistSelectionRoute => GoRouteData.$route(
      path: '/select-checklist/:shopId',
      factory: $ChecklistSelectionRouteExtension._fromState,
    );

extension $ChecklistSelectionRouteExtension on ChecklistSelectionRoute {
  static ChecklistSelectionRoute _fromState(GoRouterState state) =>
      ChecklistSelectionRoute(
        shopId: state.pathParameters['shopId']!,
      );

  String get location => GoRouteData.$location(
        '/select-checklist/${Uri.encodeComponent(shopId)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $manageWorkshopRoute => GoRouteData.$route(
      path: '/mechanic-dashboard/:shopId/workshop',
      factory: $ManageWorkshopRouteExtension._fromState,
    );

extension $ManageWorkshopRouteExtension on ManageWorkshopRoute {
  static ManageWorkshopRoute _fromState(GoRouterState state) =>
      ManageWorkshopRoute(
        shopId: state.pathParameters['shopId']!,
      );

  String get location => GoRouteData.$location(
        '/mechanic-dashboard/${Uri.encodeComponent(shopId)}/workshop',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
