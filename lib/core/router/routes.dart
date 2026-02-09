import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/registration_screen.dart';
import '../../features/dashboard/presentation/screens/main_screen.dart';
import '../../features/mypage/presentation/screens/my_page_screen.dart';
import '../../features/dashboard/presentation/screens/create_shop_screen.dart';

import '../../features/auth/presentation/screens/change_password_screen.dart';
import '../../features/mechanic_dashboard/presentation/screens/mechanic_dashboard_screen.dart';
import '../../design_system/molecules/app_scaffold.dart';
import '../../features/mechanic_dashboard/presentation/screens/checklist_selection_screen.dart';

part 'routes.g.dart';

@TypedGoRoute<MainRoute>(path: '/')
class MainRoute extends GoRouteData {
  const MainRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MainScreen();
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

@TypedGoRoute<MyPageRoute>(path: '/mypage')
class MyPageRoute extends GoRouteData {
  const MyPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const MyPageScreen();
  }
}

// Keeping other existing routes as placeholders
@TypedGoRoute<DocumentRoute>(path: '/document/:shopId')
class DocumentRoute extends GoRouteData {
  const DocumentRoute({required this.shopId});

  final String shopId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MechanicDashboardScreen(shopId: shopId, checklistCount: 0);
  }
}

@TypedGoRoute<CreateShopRoute>(path: '/create-shop')
class CreateShopRoute extends GoRouteData {
  const CreateShopRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CreateShopScreen();
  }
}

@TypedGoRoute<SuccessRoute>(path: '/success')
class SuccessRoute extends GoRouteData {
  const SuccessRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AppScaffold(body: Center(child: Text('Success!')));
  }
}

@TypedGoRoute<ChangePasswordRoute>(path: '/change-password')
class ChangePasswordRoute extends GoRouteData {
  const ChangePasswordRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ChangePasswordScreen();
  }
}

@TypedGoRoute<MechanicDashboardRoute>(path: '/mechanic-dashboard/:shopId')
class MechanicDashboardRoute extends GoRouteData {
  final String shopId;
  final int checklistCount;
  const MechanicDashboardRoute({
    required this.shopId,
    required this.checklistCount,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MechanicDashboardScreen(
      shopId: shopId,
      checklistCount: checklistCount,
    );
  }
}

@TypedGoRoute<ChecklistSelectionRoute>(path: '/select-checklist/:shopId')
class ChecklistSelectionRoute extends GoRouteData {
  final String shopId;

  const ChecklistSelectionRoute({required this.shopId});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ChecklistSelectionScreen(shopId: shopId);
  }
}
