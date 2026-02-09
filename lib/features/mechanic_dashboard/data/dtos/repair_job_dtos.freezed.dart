// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repair_job_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RepairJobResponseDto _$RepairJobResponseDtoFromJson(Map<String, dynamic> json) {
  return _RepairJobResponseDto.fromJson(json);
}

/// @nodoc
mixin _$RepairJobResponseDto {
  String get id => throw _privateConstructorUsedError;
  String get repairShopId => throw _privateConstructorUsedError;
  String get assigneeUserId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepairJobResponseDtoCopyWith<RepairJobResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepairJobResponseDtoCopyWith<$Res> {
  factory $RepairJobResponseDtoCopyWith(RepairJobResponseDto value,
          $Res Function(RepairJobResponseDto) then) =
      _$RepairJobResponseDtoCopyWithImpl<$Res, RepairJobResponseDto>;
  @useResult
  $Res call(
      {String id,
      String repairShopId,
      String assigneeUserId,
      String status,
      String? description});
}

/// @nodoc
class _$RepairJobResponseDtoCopyWithImpl<$Res,
        $Val extends RepairJobResponseDto>
    implements $RepairJobResponseDtoCopyWith<$Res> {
  _$RepairJobResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? repairShopId = null,
    Object? assigneeUserId = null,
    Object? status = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      repairShopId: null == repairShopId
          ? _value.repairShopId
          : repairShopId // ignore: cast_nullable_to_non_nullable
              as String,
      assigneeUserId: null == assigneeUserId
          ? _value.assigneeUserId
          : assigneeUserId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RepairJobResponseDtoImplCopyWith<$Res>
    implements $RepairJobResponseDtoCopyWith<$Res> {
  factory _$$RepairJobResponseDtoImplCopyWith(_$RepairJobResponseDtoImpl value,
          $Res Function(_$RepairJobResponseDtoImpl) then) =
      __$$RepairJobResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String repairShopId,
      String assigneeUserId,
      String status,
      String? description});
}

/// @nodoc
class __$$RepairJobResponseDtoImplCopyWithImpl<$Res>
    extends _$RepairJobResponseDtoCopyWithImpl<$Res, _$RepairJobResponseDtoImpl>
    implements _$$RepairJobResponseDtoImplCopyWith<$Res> {
  __$$RepairJobResponseDtoImplCopyWithImpl(_$RepairJobResponseDtoImpl _value,
      $Res Function(_$RepairJobResponseDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? repairShopId = null,
    Object? assigneeUserId = null,
    Object? status = null,
    Object? description = freezed,
  }) {
    return _then(_$RepairJobResponseDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      repairShopId: null == repairShopId
          ? _value.repairShopId
          : repairShopId // ignore: cast_nullable_to_non_nullable
              as String,
      assigneeUserId: null == assigneeUserId
          ? _value.assigneeUserId
          : assigneeUserId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepairJobResponseDtoImpl implements _RepairJobResponseDto {
  const _$RepairJobResponseDtoImpl(
      {required this.id,
      required this.repairShopId,
      required this.assigneeUserId,
      required this.status,
      this.description});

  factory _$RepairJobResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepairJobResponseDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String repairShopId;
  @override
  final String assigneeUserId;
  @override
  final String status;
  @override
  final String? description;

  @override
  String toString() {
    return 'RepairJobResponseDto(id: $id, repairShopId: $repairShopId, assigneeUserId: $assigneeUserId, status: $status, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepairJobResponseDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.repairShopId, repairShopId) ||
                other.repairShopId == repairShopId) &&
            (identical(other.assigneeUserId, assigneeUserId) ||
                other.assigneeUserId == assigneeUserId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, repairShopId, assigneeUserId, status, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RepairJobResponseDtoImplCopyWith<_$RepairJobResponseDtoImpl>
      get copyWith =>
          __$$RepairJobResponseDtoImplCopyWithImpl<_$RepairJobResponseDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepairJobResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _RepairJobResponseDto implements RepairJobResponseDto {
  const factory _RepairJobResponseDto(
      {required final String id,
      required final String repairShopId,
      required final String assigneeUserId,
      required final String status,
      final String? description}) = _$RepairJobResponseDtoImpl;

  factory _RepairJobResponseDto.fromJson(Map<String, dynamic> json) =
      _$RepairJobResponseDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get repairShopId;
  @override
  String get assigneeUserId;
  @override
  String get status;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$RepairJobResponseDtoImplCopyWith<_$RepairJobResponseDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
