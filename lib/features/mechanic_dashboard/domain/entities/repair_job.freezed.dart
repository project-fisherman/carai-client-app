// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repair_job.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RepairJob {
  int get id => throw _privateConstructorUsedError;
  int get repairShopId => throw _privateConstructorUsedError;
  int get assigneeUserId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RepairJobCopyWith<RepairJob> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepairJobCopyWith<$Res> {
  factory $RepairJobCopyWith(RepairJob value, $Res Function(RepairJob) then) =
      _$RepairJobCopyWithImpl<$Res, RepairJob>;
  @useResult
  $Res call(
      {int id,
      int repairShopId,
      int assigneeUserId,
      String status,
      String? description});
}

/// @nodoc
class _$RepairJobCopyWithImpl<$Res, $Val extends RepairJob>
    implements $RepairJobCopyWith<$Res> {
  _$RepairJobCopyWithImpl(this._value, this._then);

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
              as int,
      repairShopId: null == repairShopId
          ? _value.repairShopId
          : repairShopId // ignore: cast_nullable_to_non_nullable
              as int,
      assigneeUserId: null == assigneeUserId
          ? _value.assigneeUserId
          : assigneeUserId // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$RepairJobImplCopyWith<$Res>
    implements $RepairJobCopyWith<$Res> {
  factory _$$RepairJobImplCopyWith(
          _$RepairJobImpl value, $Res Function(_$RepairJobImpl) then) =
      __$$RepairJobImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int repairShopId,
      int assigneeUserId,
      String status,
      String? description});
}

/// @nodoc
class __$$RepairJobImplCopyWithImpl<$Res>
    extends _$RepairJobCopyWithImpl<$Res, _$RepairJobImpl>
    implements _$$RepairJobImplCopyWith<$Res> {
  __$$RepairJobImplCopyWithImpl(
      _$RepairJobImpl _value, $Res Function(_$RepairJobImpl) _then)
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
    return _then(_$RepairJobImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      repairShopId: null == repairShopId
          ? _value.repairShopId
          : repairShopId // ignore: cast_nullable_to_non_nullable
              as int,
      assigneeUserId: null == assigneeUserId
          ? _value.assigneeUserId
          : assigneeUserId // ignore: cast_nullable_to_non_nullable
              as int,
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

class _$RepairJobImpl implements _RepairJob {
  const _$RepairJobImpl(
      {required this.id,
      required this.repairShopId,
      required this.assigneeUserId,
      required this.status,
      this.description});

  @override
  final int id;
  @override
  final int repairShopId;
  @override
  final int assigneeUserId;
  @override
  final String status;
  @override
  final String? description;

  @override
  String toString() {
    return 'RepairJob(id: $id, repairShopId: $repairShopId, assigneeUserId: $assigneeUserId, status: $status, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepairJobImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.repairShopId, repairShopId) ||
                other.repairShopId == repairShopId) &&
            (identical(other.assigneeUserId, assigneeUserId) ||
                other.assigneeUserId == assigneeUserId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, repairShopId, assigneeUserId, status, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RepairJobImplCopyWith<_$RepairJobImpl> get copyWith =>
      __$$RepairJobImplCopyWithImpl<_$RepairJobImpl>(this, _$identity);
}

abstract class _RepairJob implements RepairJob {
  const factory _RepairJob(
      {required final int id,
      required final int repairShopId,
      required final int assigneeUserId,
      required final String status,
      final String? description}) = _$RepairJobImpl;

  @override
  int get id;
  @override
  int get repairShopId;
  @override
  int get assigneeUserId;
  @override
  String get status;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$RepairJobImplCopyWith<_$RepairJobImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
