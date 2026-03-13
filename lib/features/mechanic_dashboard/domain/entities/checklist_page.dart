import 'package:freezed_annotation/freezed_annotation.dart';
import 'safety_checklist.dart';

part 'checklist_page.freezed.dart';

@freezed
class ChecklistPage with _$ChecklistPage {
  const factory ChecklistPage({
    required List<SafetyChecklist> items,
    String? nextLastId,
    required bool hasMore,
  }) = _ChecklistPage;
}
