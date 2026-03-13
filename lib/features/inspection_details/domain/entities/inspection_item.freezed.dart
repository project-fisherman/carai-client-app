// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inspection_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InspectionItem _$InspectionItemFromJson(Map<String, dynamic> json) {
  return _InspectionItem.fromJson(json);
}

/// @nodoc
mixin _$InspectionItem {
  @JsonKey(name: 'seq_no')
  int get seqNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_name')
  String get itemName => throw _privateConstructorUsedError;
  String get method => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'widget_type_id',
      unknownEnumValue: InspectionItemWidgetType.goodWarningCheck)
  InspectionItemWidgetType? get widgetType =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InspectionItemCopyWith<InspectionItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InspectionItemCopyWith<$Res> {
  factory $InspectionItemCopyWith(
          InspectionItem value, $Res Function(InspectionItem) then) =
      _$InspectionItemCopyWithImpl<$Res, InspectionItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'seq_no') int seqNo,
      @JsonKey(name: 'item_name') String itemName,
      String method,
      @JsonKey(
          name: 'widget_type_id',
          unknownEnumValue: InspectionItemWidgetType.goodWarningCheck)
      InspectionItemWidgetType? widgetType});
}

/// @nodoc
class _$InspectionItemCopyWithImpl<$Res, $Val extends InspectionItem>
    implements $InspectionItemCopyWith<$Res> {
  _$InspectionItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seqNo = null,
    Object? itemName = null,
    Object? method = null,
    Object? widgetType = freezed,
  }) {
    return _then(_value.copyWith(
      seqNo: null == seqNo
          ? _value.seqNo
          : seqNo // ignore: cast_nullable_to_non_nullable
              as int,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      widgetType: freezed == widgetType
          ? _value.widgetType
          : widgetType // ignore: cast_nullable_to_non_nullable
              as InspectionItemWidgetType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InspectionItemImplCopyWith<$Res>
    implements $InspectionItemCopyWith<$Res> {
  factory _$$InspectionItemImplCopyWith(_$InspectionItemImpl value,
          $Res Function(_$InspectionItemImpl) then) =
      __$$InspectionItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'seq_no') int seqNo,
      @JsonKey(name: 'item_name') String itemName,
      String method,
      @JsonKey(
          name: 'widget_type_id',
          unknownEnumValue: InspectionItemWidgetType.goodWarningCheck)
      InspectionItemWidgetType? widgetType});
}

/// @nodoc
class __$$InspectionItemImplCopyWithImpl<$Res>
    extends _$InspectionItemCopyWithImpl<$Res, _$InspectionItemImpl>
    implements _$$InspectionItemImplCopyWith<$Res> {
  __$$InspectionItemImplCopyWithImpl(
      _$InspectionItemImpl _value, $Res Function(_$InspectionItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seqNo = null,
    Object? itemName = null,
    Object? method = null,
    Object? widgetType = freezed,
  }) {
    return _then(_$InspectionItemImpl(
      seqNo: null == seqNo
          ? _value.seqNo
          : seqNo // ignore: cast_nullable_to_non_nullable
              as int,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      widgetType: freezed == widgetType
          ? _value.widgetType
          : widgetType // ignore: cast_nullable_to_non_nullable
              as InspectionItemWidgetType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InspectionItemImpl implements _InspectionItem {
  const _$InspectionItemImpl(
      {@JsonKey(name: 'seq_no') required this.seqNo,
      @JsonKey(name: 'item_name') required this.itemName,
      required this.method,
      @JsonKey(
          name: 'widget_type_id',
          unknownEnumValue: InspectionItemWidgetType.goodWarningCheck)
      this.widgetType});

  factory _$InspectionItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$InspectionItemImplFromJson(json);

  @override
  @JsonKey(name: 'seq_no')
  final int seqNo;
  @override
  @JsonKey(name: 'item_name')
  final String itemName;
  @override
  final String method;
  @override
  @JsonKey(
      name: 'widget_type_id',
      unknownEnumValue: InspectionItemWidgetType.goodWarningCheck)
  final InspectionItemWidgetType? widgetType;

  @override
  String toString() {
    return 'InspectionItem(seqNo: $seqNo, itemName: $itemName, method: $method, widgetType: $widgetType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InspectionItemImpl &&
            (identical(other.seqNo, seqNo) || other.seqNo == seqNo) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.widgetType, widgetType) ||
                other.widgetType == widgetType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, seqNo, itemName, method, widgetType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InspectionItemImplCopyWith<_$InspectionItemImpl> get copyWith =>
      __$$InspectionItemImplCopyWithImpl<_$InspectionItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InspectionItemImplToJson(
      this,
    );
  }
}

abstract class _InspectionItem implements InspectionItem {
  const factory _InspectionItem(
      {@JsonKey(name: 'seq_no') required final int seqNo,
      @JsonKey(name: 'item_name') required final String itemName,
      required final String method,
      @JsonKey(
          name: 'widget_type_id',
          unknownEnumValue: InspectionItemWidgetType.goodWarningCheck)
      final InspectionItemWidgetType? widgetType}) = _$InspectionItemImpl;

  factory _InspectionItem.fromJson(Map<String, dynamic> json) =
      _$InspectionItemImpl.fromJson;

  @override
  @JsonKey(name: 'seq_no')
  int get seqNo;
  @override
  @JsonKey(name: 'item_name')
  String get itemName;
  @override
  String get method;
  @override
  @JsonKey(
      name: 'widget_type_id',
      unknownEnumValue: InspectionItemWidgetType.goodWarningCheck)
  InspectionItemWidgetType? get widgetType;
  @override
  @JsonKey(ignore: true)
  _$$InspectionItemImplCopyWith<_$InspectionItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
