import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/safety_checklist.dart';
import '../../domain/entities/checklist_page.dart';
import '../../domain/repositories/safety_checklist_repository.dart';
import '../../../inspection_details/domain/entities/inspection_form.dart';
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
  Future<Either<Failure, ChecklistPage>> getSafetyChecklists({
    required String shopId,
    bool? isPreset,
    String? lastId,
    int size = 20,
  }) async {
    try {
      final dto = await _api.getSafetyChecklists(
        shopId: shopId,
        isPreset: isPreset,
        lastId: lastId,
        size: size,
      );
      final entities = dto.items
          .map(
            (itemDto) => SafetyChecklist(
              id: itemDto.id,
              name: itemDto.name,
              imageUrl: itemDto.imageUrl,
              jsonUrl: itemDto.jsonUrl,
              htmlUrl: itemDto.htmlUrl,
              isPreset: itemDto.isPreset,
              createdAt: itemDto.createdAt != null
                  ? DateTime.parse(itemDto.createdAt!)
                  : null,
              updatedAt: itemDto.updatedAt != null
                  ? DateTime.parse(itemDto.updatedAt!)
                  : null,
            ),
          )
          .toList();
      final page = ChecklistPage(
        items: entities,
        nextLastId: dto.nextLastId,
        hasMore: dto.hasMore,
      );
      return Right(page);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, InspectionForm>> getChecklistPreview(
    String jsonUrl,
  ) async {
    try {
      // jsonUrl is a full URL, so we can't use _api (Retrofit) directly if it's external or different base.
      // However, usually these URLs are relative or absolute.
      // If it's a full URL, we should use a raw Dio instance or a specific method.
      // Given the architecture, I'll assume I can use a raw Dio request here since it's a dynamic URL.
      // But I don't have access to Dio directly here easily without injecting it.
      // Wait, _api is SafetyChecklistApi which is Retrofit.
      // I should add a method to SafetyChecklistApi if possible, or use Dio directly.
      // Let's look at SafetyChecklistApi.
      // Ideally, the datasource should handle this.
      // But for now, I'll assume I can use the _api if I add a method @GET with dynamic url?
      // Or better, let's just use Dio directly here for simplicity as it's a "download" operation.
      // I need to import Dio.
      // Actually, let's keep it clean. I should add `getChecklistPreview(url)` to `SafetyChecklistApi`.

      final form = await _api.getChecklistPreview(jsonUrl);
      return Right(form);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ChecklistPage>> getShopChecklists({
    required String shopId,
    String? lastId,
    int size = 20,
  }) async {
    try {
      final dto = await _api.getShopChecklists(
        shopId: shopId,
        lastId: lastId,
        size: size,
      );
      final entities = dto.items
          .map(
            (itemDto) => SafetyChecklist(
              id: itemDto.id,
              name: itemDto.name,
              imageUrl: itemDto.imageUrl,
              jsonUrl: itemDto.jsonUrl,
              htmlUrl: itemDto.htmlUrl,
              isPreset: itemDto.isPreset,
              createdAt: itemDto.createdAt != null
                  ? DateTime.parse(itemDto.createdAt!)
                  : null,
              updatedAt: itemDto.updatedAt != null
                  ? DateTime.parse(itemDto.updatedAt!)
                  : null,
            ),
          )
          .toList();
      final page = ChecklistPage(
        items: entities,
        nextLastId: dto.nextLastId,
        hasMore: dto.hasMore,
      );
      return Right(page);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SafetyChecklist>> registerShopChecklist({
    required String shopId,
    required String checklistId,
  }) async {
    try {
      final dto = await _api.registerShopChecklist(
        shopId: shopId,
        checklistId: checklistId,
      );
      final entity = SafetyChecklist(
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
      );
      return Right(entity);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeShopChecklists({
    required String shopId,
    required List<String> checklistIds,
  }) async {
    try {
      await _api.removeShopChecklists(
        shopId: shopId,
        checklistIds: checklistIds,
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
