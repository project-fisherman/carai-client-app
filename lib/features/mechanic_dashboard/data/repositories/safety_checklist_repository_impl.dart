import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/safety_checklist.dart';
import '../../domain/repositories/safety_checklist_repository.dart';
import '../data_sources/safety_checklist_api.dart';

part 'safety_checklist_repository_impl.g.dart';

@riverpod
SafetyChecklistRepository safetyChecklistRepository(
  SafetyChecklistRepositoryRef ref,
) {
  return SafetyChecklistRepositoryImpl(ref.watch(safetyChecklistApiProvider));
}

class SafetyChecklistRepositoryImpl implements SafetyChecklistRepository {
  final SafetyChecklistApi _api;

  SafetyChecklistRepositoryImpl(this._api);

  @override
  Future<Either<Failure, List<SafetyChecklist>>> getSafetyChecklists({
    bool? isPreset,
  }) async {
    try {
      final dtos = await _api.getSafetyChecklists(isPreset: isPreset);
      final entities = dtos
          .map(
            (dto) => SafetyChecklist(
              id: dto.id,
              name: dto.name,
              imageUrl: dto.imageUrl,
              jsonUrl: dto.jsonUrl,
              htmlUrl: dto.htmlUrl,
              isPreset: dto.isPreset,
              createdAt: dto.createdAt != null
                  ? DateTime.parse(dto.createdAt!)
                  : null,
              updatedAt: dto.updatedAt != null
                  ? DateTime.parse(dto.updatedAt!)
                  : null,
            ),
          )
          .toList();
      return Right(entities);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
