import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/error/failure.dart';
import '../data_sources/repair_job_api.dart';
import '../../domain/entities/repair_job.dart';
import '../../domain/repositories/repair_job_repository.dart';

part 'repair_job_repository_impl.g.dart';

@riverpod
RepairJobRepository repairJobRepository(RepairJobRepositoryRef ref) {
  return RepairJobRepositoryImpl(ref.watch(repairJobApiProvider));
}

class RepairJobRepositoryImpl implements RepairJobRepository {
  final RepairJobApi _api;

  RepairJobRepositoryImpl(this._api);

  @override
  Future<Either<Failure, List<RepairJob>>> getMyJobs({String? status}) async {
    try {
      final dtos = await _api.getMyJobs(status: status);
      final jobs = dtos
          .map(
            (dto) => RepairJob(
              id: dto.id,
              repairShopId: dto.repairShopId,
              assigneeUserId: dto.assigneeUserId,
              status: dto.status,
              description: dto.description,
            ),
          )
          .toList();
      return Right(jobs);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
