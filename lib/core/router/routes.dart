import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/registration_screen.dart';
import '../../features/dashboard/presentation/screens/main_screen.dart';
import '../../features/mypage/presentation/screens/my_page_screen.dart';
import '../../features/dashboard/presentation/screens/create_shop_screen.dart';
import '../../features/mechanic_dashboard/domain/entities/repair_shop_user.dart';

import '../../features/auth/presentation/screens/change_password_screen.dart';
import '../../features/mechanic_dashboard/presentation/screens/mechanic_dashboard_screen.dart';
import '../../features/mechanic_dashboard/presentation/screens/manage_workshop_screen.dart';
import '../../features/mechanic_dashboard/presentation/screens/checklist_management_screen.dart';
import '../../design_system/molecules/app_scaffold.dart';
import '../../features/mechanic_dashboard/presentation/screens/checklist_selection_screen.dart';
import '../../features/mechanic_dashboard/presentation/screens/job_checklist_selection_screen.dart';
import '../../features/mechanic_dashboard/presentation/screens/checklist_preview_screen.dart';
import '../../features/inspection_details/presentation/screens/inspection_details_screen.dart';
import '../../features/inspection_details/presentation/screens/ai_report_screen.dart';
import '../../features/mechanic_dashboard/data/dtos/repair_job_dtos.dart';
import '../../features/mechanic_dashboard/presentation/screens/search_history_screen.dart';

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
    return MechanicDashboardScreen(shopId: shopId);
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
    return const AppScaffold(body: Center(child: Text('성공!')));
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
  const MechanicDashboardRoute({required this.shopId});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return MechanicDashboardScreen(shopId: shopId);
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

@TypedGoRoute<ChecklistManagementRoute>(path: '/checklist-management/:shopId')
class ChecklistManagementRoute extends GoRouteData {
  final String shopId;

  const ChecklistManagementRoute({required this.shopId});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ChecklistManagementScreen(shopId: shopId);
  }
}

@TypedGoRoute<SearchHistoryRoute>(path: '/search-history/:shopId')
class SearchHistoryRoute extends GoRouteData {
  final String shopId;

  const SearchHistoryRoute({required this.shopId});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SearchHistoryScreen(shopId: shopId);
  }
}

@TypedGoRoute<JobChecklistSelectionRoute>(path: '/job-checklist-selection/:shopId/:jobId')
class JobChecklistSelectionRoute extends GoRouteData {
  final String shopId;
  final String jobId;

  const JobChecklistSelectionRoute({required this.shopId, required this.jobId});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return JobChecklistSelectionScreen(shopId: shopId, jobId: jobId);
  }
}

@TypedGoRoute<ManageWorkshopRoute>(path: '/mechanic-dashboard/:shopId/workshop')
class ManageWorkshopRoute extends GoRouteData {
  final String shopId;
  final RepairShopRole? userRole;

  const ManageWorkshopRoute({required this.shopId, this.userRole});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ManageWorkshopScreen(shopId: shopId, userRole: userRole);
  }
}

@TypedGoRoute<ChecklistPreviewRoute>(path: '/checklist-preview')
class ChecklistPreviewRoute extends GoRouteData {
  final String shopId;
  final String checklistId;
  final String jsonUrl;
  final String checklistName;
  final String imageUrl;

  const ChecklistPreviewRoute({
    required this.shopId,
    required this.checklistId,
    required this.jsonUrl,
    required this.checklistName,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ChecklistPreviewScreen(
      shopId: shopId,
      checklistId: checklistId,
      jsonUrl: jsonUrl,
      checklistName: checklistName,
      imageUrl: imageUrl,
    );
  }
}

@TypedGoRoute<InspectionDetailsRoute>(path: '/inspection-details')
class InspectionDetailsRoute extends GoRouteData {
  final String? jobId;
  final bool isReadOnly;
  final RepairJobDetailResponseDto? $extra;

  const InspectionDetailsRoute({
    this.jobId,
    this.isReadOnly = false,
    this.$extra,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return InspectionDetailsScreen(
      jobId: jobId!,
      isReadOnly: isReadOnly,
      jobDetail: $extra,
    );
  }
}

@TypedGoRoute<InviteRoute>(path: '/invites/:token')
class InviteRoute extends GoRouteData {
  final String token;
  const InviteRoute({required this.token});

  @override
  String? redirect(BuildContext context, GoRouterState state) {
    // We cannot use ref.read inside GoRouteData directly comfortably without a provider
    // But since this is a TypedGoRoute, we might need to handle it in the provider or a separate listener.
    // However, for simplicity here, we can use a static way or handle it in the build/redirect if we have access to ref.
    return '/'; // Always redirect to home
  }
}

@TypedGoRoute<AiReportRoute>(path: '/ai-report/:jobId')
class AiReportRoute extends GoRouteData {
  final String jobId;

  const AiReportRoute({required this.jobId});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    // We haven't created the screen yet, so if it fails we will create it soon
    // import will be added in the next step
    return AiReportScreen(jobId: jobId);
  }
}
