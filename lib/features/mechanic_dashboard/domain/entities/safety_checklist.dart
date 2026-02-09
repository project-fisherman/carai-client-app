import 'package:freezed_annotation/freezed_annotation.dart';

part 'safety_checklist.freezed.dart';

@freezed
class SafetyChecklist with _$SafetyChecklist {
  const factory SafetyChecklist({
    required int id,
    required String name,
    required String imageUrl,
    required String jsonUrl,
    required String htmlUrl,
    required bool isPreset,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _SafetyChecklist;
}
