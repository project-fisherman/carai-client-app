import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/inspection_form.dart';
import '../../domain/entities/inspection_item.dart';
import '../../domain/repositories/inspection_repository.dart';

part 'mock_inspection_repository.g.dart';

@riverpod
InspectionRepository inspectionRepository(InspectionRepositoryRef ref) {
  return MockInspectionRepository();
}

class MockInspectionRepository implements InspectionRepository {
  @override
  Future<Either<Failure, InspectionForm>> getInspectionForm() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    return Right(
      InspectionForm(
        meta: const InspectionMeta(
          id: '550e8400-e29b-41d4-a716-446655440000',
          status: 'draft',
        ),
        header: [
          const InspectionHeaderField(
            id: 'car_model',
            label: '차종',
            type: 'text',
          ),
          const InspectionHeaderField(
            id: 'car_number',
            label: '차량번호',
            type: 'text',
          ),
          const InspectionHeaderField(
            id: 'customer_name',
            label: '고객성명',
            type: 'text',
          ),
          const InspectionHeaderField(
            id: 'customer_contact',
            label: '연락처',
            type: 'text',
          ),
          const InspectionHeaderField(
            id: 'mileage',
            label: '주행거리',
            type: 'number',
          ),
          const InspectionHeaderField(
            id: 'inspection_date',
            label: '점검일자',
            type: 'date',
          ),
        ],
        groups: [
          InspectionGroup(
            groupSeq: 1,
            groupLabel: 'Body / Exterior',
            items: [
              const InspectionItem(
                seqNo: 1,
                itemName: '차체 외관',
                method: '차체 손상 유무 / 도장 상태',
                widgetType: InspectionItemWidgetType.goodWarningCheck,
              ),
              const InspectionItem(
                seqNo: 2,
                itemName: '전면/측면/후면유리',
                method: '유리 상태 (균열, 흠집 여부)',
                widgetType: InspectionItemWidgetType.goodWarningCheck,
              ),
              const InspectionItem(
                seqNo: 3,
                itemName: '전방/후방 램프',
                method: '전방 (상향등 / 하향등 / 미등 안개등)<br>후방(브레이크등 / 후진등 / 번호판등)',
                widgetType: InspectionItemWidgetType.goodWarningCheck,
              ),
              const InspectionItem(
                seqNo: 4,
                itemName: '와이퍼 및 워셔액',
                method: '와이퍼 닦임 상태 / 워셔액 레벨',
                widgetType: InspectionItemWidgetType.goodWarningCheck,
              ),
            ],
          ),
          InspectionGroup(
            groupSeq: 2,
            groupLabel: 'Engine / Fluids',
            items: [
              const InspectionItem(
                seqNo: 5,
                itemName: '배터리',
                method: '배터리 전압 / 단자 부식',
                widgetType: InspectionItemWidgetType.goodWarningCheck,
              ),
              const InspectionItem(
                seqNo: 6,
                itemName: '점화 플러그',
                method: '마모 및 오염 상태 / 교환 주기',
                widgetType: InspectionItemWidgetType.goodWarningCheck,
              ),
              const InspectionItem(
                seqNo: 7,
                itemName: '연료 필터',
                method: '연료 필터 상태 / 교환 주기',
                widgetType: InspectionItemWidgetType.goodWarningCheck,
              ),
              const InspectionItem(
                seqNo: 8,
                itemName: '냉각수',
                method: '냉각수 레벨 / 오염 및 누수 여부',
                widgetType: InspectionItemWidgetType.goodWarningCheck,
              ),
              const InspectionItem(
                seqNo: 9,
                itemName: '엔진오일',
                method: '오일 레벨 / 오일 상태 / 교환 주기',
                widgetType: InspectionItemWidgetType.goodWarningCheck,
              ),
              const InspectionItem(
                seqNo: 10,
                itemName: '미션오일',
                method: '오일 레벨 / 오일 상태 / 교환 주기',
                widgetType: InspectionItemWidgetType.goodWarningCheck,
              ),
              const InspectionItem(
                seqNo: 11,
                itemName: '브레이크 오일',
                method: '오일 레벨 / 오일 상태 / 교환 주기',
                widgetType: InspectionItemWidgetType.goodWarningCheck,
              ),
            ],
          ),
          InspectionGroup(
            groupSeq: 3,
            groupLabel: 'Tires / Brakes / Undercarriage',
            items: [
              const InspectionItem(
                seqNo: 12,
                itemName: '타이어',
                method: '트레드 깊이 (앞 %smm, 뒤 %smm)<br>타이어 압력 (제조사 권장 공기압)',
                widgetType:
                    InspectionItemWidgetType.frontAndRearMeasurementCheck,
              ),
              const InspectionItem(
                seqNo: 13,
                itemName: '브레이크 패드 및 디스크',
                method: '패드 두께 (앞 %s%, 뒤 %s%)<br>디스크 마모 상태',
                widgetType:
                    InspectionItemWidgetType.frontAndRearMeasurementCheck,
              ),
              const InspectionItem(
                seqNo: 14,
                itemName: '허브 베어링 및 하체 유격',
                method: '허브 베어링 이상 소음 및 하체 유격 발생 유무',
                widgetType: InspectionItemWidgetType.goodWarningCheck,
              ),
              const InspectionItem(
                seqNo: 15,
                itemName: '서스펜션 및 하체 부식',
                method: '손상 유무 / 부식 상태',
                widgetType: InspectionItemWidgetType.goodWarningCheck,
              ),
              const InspectionItem(
                seqNo: 16,
                itemName: '배기 시스템',
                method: '배기 파이프 및 연결부 / 부식 상태',
                widgetType: InspectionItemWidgetType.goodWarningCheck,
              ),
            ],
          ),
          InspectionGroup(
            groupSeq: 4,
            groupLabel: 'Electronics / Others',
            items: [
              const InspectionItem(
                seqNo: 17,
                itemName: '계기판',
                method: '계기판 경고등 점등 유무',
                widgetType: InspectionItemWidgetType.goodWarningCheck,
              ),
              const InspectionItem(
                seqNo: 18,
                itemName: '공조 장치',
                method: '에어컨&히터 작동 / 에어컨 필터',
                widgetType: InspectionItemWidgetType.goodWarningCheck,
              ),
              const InspectionItem(
                seqNo: 19,
                itemName: '조향 장치(스티어링)',
                method: '조향 각도 및 이상 소음',
                widgetType: InspectionItemWidgetType.goodWarningCheck,
              ),
              const InspectionItem(
                seqNo: 20,
                itemName: '전자 제어 시스템',
                method: '스캐너를 통한 결함코드 점검',
                widgetType: InspectionItemWidgetType.goodWarningCheck,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Future<Either<Failure, void>> submitInspection(
    String formId,
    Map<String, dynamic> answers,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    print('-----------------------------------------');
    print('SUBMITTING INSPECTION FORM: $formId');
    print('ANSWERS: $answers');
    print('-----------------------------------------');
    return const Right(null);
  }
}
