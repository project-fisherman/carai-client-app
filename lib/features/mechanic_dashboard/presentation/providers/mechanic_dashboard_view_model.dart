import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../dashboard/data/data_sources/repair_shop_api.dart';
import '../../../dashboard/data/dtos/mechanic_dashboard_dtos.dart';
import '../../domain/entities/repair_job.dart';
import '../../data/repositories/repair_job_repository_impl.dart';

part 'mechanic_dashboard_view_model.g.dart';

@riverpod
class MechanicDashboardViewModel extends _$MechanicDashboardViewModel {
  @override
  FutureOr<List<RepairJob>> build(String shopId) async {
    final result = await ref.watch(repairJobRepositoryProvider).getMyJobs();

    return result.fold(
      (failure) => throw Exception(failure.message),
      (jobs) => jobs.where((job) => job.repairShopId == shopId).toList(),
    );
  }
}

@riverpod
Future<RepairShopRole> userRole(UserRoleRef ref, String shopId) async {
  final api = ref.watch(repairShopApiProvider);
  final profile = await api.getMyProfile(shopId: shopId);
  return profile.role;
}
