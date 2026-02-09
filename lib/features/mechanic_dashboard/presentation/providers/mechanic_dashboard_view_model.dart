import 'package:riverpod_annotation/riverpod_annotation.dart';
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
