// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manage_workshop_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RepairShopUserResponse _$RepairShopUserResponseFromJson(
    Map<String, dynamic> json) {
  return _RepairShopUserResponse.fromJson(json);
}

/// @nodoc
mixin _$RepairShopUserResponse {
  String get id => throw _privateConstructorUsedError;
  String get repairShopId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepairShopUserResponseCopyWith<RepairShopUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepairShopUserResponseCopyWith<$Res> {
  factory $RepairShopUserResponseCopyWith(RepairShopUserResponse value,
          $Res Function(RepairShopUserResponse) then) =
      _$RepairShopUserResponseCopyWithImpl<$Res, RepairShopUserResponse>;
  @useResult
  $Res call({String id, String repairShopId, String userId, String role});
}

/// @nodoc
class _$RepairShopUserResponseCopyWithImpl<$Res,
        $Val extends RepairShopUserResponse>
    implements $RepairShopUserResponseCopyWith<$Res> {
  _$RepairShopUserResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? repairShopId = null,
    Object? userId = null,
    Object? role = null,
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
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RepairShopUserResponseImplCopyWith<$Res>
    implements $RepairShopUserResponseCopyWith<$Res> {
  factory _$$RepairShopUserResponseImplCopyWith(
          _$RepairShopUserResponseImpl value,
          $Res Function(_$RepairShopUserResponseImpl) then) =
      __$$RepairShopUserResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String repairShopId, String userId, String role});
}

/// @nodoc
class __$$RepairShopUserResponseImplCopyWithImpl<$Res>
    extends _$RepairShopUserResponseCopyWithImpl<$Res,
        _$RepairShopUserResponseImpl>
    implements _$$RepairShopUserResponseImplCopyWith<$Res> {
  __$$RepairShopUserResponseImplCopyWithImpl(
      _$RepairShopUserResponseImpl _value,
      $Res Function(_$RepairShopUserResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? repairShopId = null,
    Object? userId = null,
    Object? role = null,
  }) {
    return _then(_$RepairShopUserResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      repairShopId: null == repairShopId
          ? _value.repairShopId
          : repairShopId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepairShopUserResponseImpl extends _RepairShopUserResponse {
  const _$RepairShopUserResponseImpl(
      {required this.id,
      required this.repairShopId,
      required this.userId,
      required this.role})
      : super._();

  factory _$RepairShopUserResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepairShopUserResponseImplFromJson(json);

  @override
  final String id;
  @override
  final String repairShopId;
  @override
  final String userId;
  @override
  final String role;

  @override
  String toString() {
    return 'RepairShopUserResponse(id: $id, repairShopId: $repairShopId, userId: $userId, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepairShopUserResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.repairShopId, repairShopId) ||
                other.repairShopId == repairShopId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, repairShopId, userId, role);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RepairShopUserResponseImplCopyWith<_$RepairShopUserResponseImpl>
      get copyWith => __$$RepairShopUserResponseImplCopyWithImpl<
          _$RepairShopUserResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepairShopUserResponseImplToJson(
      this,
    );
  }
}

abstract class _RepairShopUserResponse extends RepairShopUserResponse {
  const factory _RepairShopUserResponse(
      {required final String id,
      required final String repairShopId,
      required final String userId,
      required final String role}) = _$RepairShopUserResponseImpl;
  const _RepairShopUserResponse._() : super._();

  factory _RepairShopUserResponse.fromJson(Map<String, dynamic> json) =
      _$RepairShopUserResponseImpl.fromJson;

  @override
  String get id;
  @override
  String get repairShopId;
  @override
  String get userId;
  @override
  String get role;
  @override
  @JsonKey(ignore: true)
  _$$RepairShopUserResponseImplCopyWith<_$RepairShopUserResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ChangeRoleRequest _$ChangeRoleRequestFromJson(Map<String, dynamic> json) {
  return _ChangeRoleRequest.fromJson(json);
}

/// @nodoc
mixin _$ChangeRoleRequest {
  int get targetUserId => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChangeRoleRequestCopyWith<ChangeRoleRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangeRoleRequestCopyWith<$Res> {
  factory $ChangeRoleRequestCopyWith(
          ChangeRoleRequest value, $Res Function(ChangeRoleRequest) then) =
      _$ChangeRoleRequestCopyWithImpl<$Res, ChangeRoleRequest>;
  @useResult
  $Res call({int targetUserId, String role});
}

/// @nodoc
class _$ChangeRoleRequestCopyWithImpl<$Res, $Val extends ChangeRoleRequest>
    implements $ChangeRoleRequestCopyWith<$Res> {
  _$ChangeRoleRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? targetUserId = null,
    Object? role = null,
  }) {
    return _then(_value.copyWith(
      targetUserId: null == targetUserId
          ? _value.targetUserId
          : targetUserId // ignore: cast_nullable_to_non_nullable
              as int,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChangeRoleRequestImplCopyWith<$Res>
    implements $ChangeRoleRequestCopyWith<$Res> {
  factory _$$ChangeRoleRequestImplCopyWith(_$ChangeRoleRequestImpl value,
          $Res Function(_$ChangeRoleRequestImpl) then) =
      __$$ChangeRoleRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int targetUserId, String role});
}

/// @nodoc
class __$$ChangeRoleRequestImplCopyWithImpl<$Res>
    extends _$ChangeRoleRequestCopyWithImpl<$Res, _$ChangeRoleRequestImpl>
    implements _$$ChangeRoleRequestImplCopyWith<$Res> {
  __$$ChangeRoleRequestImplCopyWithImpl(_$ChangeRoleRequestImpl _value,
      $Res Function(_$ChangeRoleRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? targetUserId = null,
    Object? role = null,
  }) {
    return _then(_$ChangeRoleRequestImpl(
      targetUserId: null == targetUserId
          ? _value.targetUserId
          : targetUserId // ignore: cast_nullable_to_non_nullable
              as int,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChangeRoleRequestImpl extends _ChangeRoleRequest {
  const _$ChangeRoleRequestImpl(
      {required this.targetUserId, required this.role})
      : super._();

  factory _$ChangeRoleRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChangeRoleRequestImplFromJson(json);

  @override
  final int targetUserId;
  @override
  final String role;

  @override
  String toString() {
    return 'ChangeRoleRequest(targetUserId: $targetUserId, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeRoleRequestImpl &&
            (identical(other.targetUserId, targetUserId) ||
                other.targetUserId == targetUserId) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, targetUserId, role);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeRoleRequestImplCopyWith<_$ChangeRoleRequestImpl> get copyWith =>
      __$$ChangeRoleRequestImplCopyWithImpl<_$ChangeRoleRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChangeRoleRequestImplToJson(
      this,
    );
  }
}

abstract class _ChangeRoleRequest extends ChangeRoleRequest {
  const factory _ChangeRoleRequest(
      {required final int targetUserId,
      required final String role}) = _$ChangeRoleRequestImpl;
  const _ChangeRoleRequest._() : super._();

  factory _ChangeRoleRequest.fromJson(Map<String, dynamic> json) =
      _$ChangeRoleRequestImpl.fromJson;

  @override
  int get targetUserId;
  @override
  String get role;
  @override
  @JsonKey(ignore: true)
  _$$ChangeRoleRequestImplCopyWith<_$ChangeRoleRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

KickUserRequest _$KickUserRequestFromJson(Map<String, dynamic> json) {
  return _KickUserRequest.fromJson(json);
}

/// @nodoc
mixin _$KickUserRequest {
  int get targetUserId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KickUserRequestCopyWith<KickUserRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KickUserRequestCopyWith<$Res> {
  factory $KickUserRequestCopyWith(
          KickUserRequest value, $Res Function(KickUserRequest) then) =
      _$KickUserRequestCopyWithImpl<$Res, KickUserRequest>;
  @useResult
  $Res call({int targetUserId});
}

/// @nodoc
class _$KickUserRequestCopyWithImpl<$Res, $Val extends KickUserRequest>
    implements $KickUserRequestCopyWith<$Res> {
  _$KickUserRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? targetUserId = null,
  }) {
    return _then(_value.copyWith(
      targetUserId: null == targetUserId
          ? _value.targetUserId
          : targetUserId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KickUserRequestImplCopyWith<$Res>
    implements $KickUserRequestCopyWith<$Res> {
  factory _$$KickUserRequestImplCopyWith(_$KickUserRequestImpl value,
          $Res Function(_$KickUserRequestImpl) then) =
      __$$KickUserRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int targetUserId});
}

/// @nodoc
class __$$KickUserRequestImplCopyWithImpl<$Res>
    extends _$KickUserRequestCopyWithImpl<$Res, _$KickUserRequestImpl>
    implements _$$KickUserRequestImplCopyWith<$Res> {
  __$$KickUserRequestImplCopyWithImpl(
      _$KickUserRequestImpl _value, $Res Function(_$KickUserRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? targetUserId = null,
  }) {
    return _then(_$KickUserRequestImpl(
      targetUserId: null == targetUserId
          ? _value.targetUserId
          : targetUserId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KickUserRequestImpl extends _KickUserRequest {
  const _$KickUserRequestImpl({required this.targetUserId}) : super._();

  factory _$KickUserRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$KickUserRequestImplFromJson(json);

  @override
  final int targetUserId;

  @override
  String toString() {
    return 'KickUserRequest(targetUserId: $targetUserId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KickUserRequestImpl &&
            (identical(other.targetUserId, targetUserId) ||
                other.targetUserId == targetUserId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, targetUserId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KickUserRequestImplCopyWith<_$KickUserRequestImpl> get copyWith =>
      __$$KickUserRequestImplCopyWithImpl<_$KickUserRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KickUserRequestImplToJson(
      this,
    );
  }
}

abstract class _KickUserRequest extends KickUserRequest {
  const factory _KickUserRequest({required final int targetUserId}) =
      _$KickUserRequestImpl;
  const _KickUserRequest._() : super._();

  factory _KickUserRequest.fromJson(Map<String, dynamic> json) =
      _$KickUserRequestImpl.fromJson;

  @override
  int get targetUserId;
  @override
  @JsonKey(ignore: true)
  _$$KickUserRequestImplCopyWith<_$KickUserRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
