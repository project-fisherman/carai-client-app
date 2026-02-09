// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repair_shop_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RepairShopUser {
  String get id => throw _privateConstructorUsedError;
  String get repairShopId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  RepairShopRole get role => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RepairShopUserCopyWith<RepairShopUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepairShopUserCopyWith<$Res> {
  factory $RepairShopUserCopyWith(
          RepairShopUser value, $Res Function(RepairShopUser) then) =
      _$RepairShopUserCopyWithImpl<$Res, RepairShopUser>;
  @useResult
  $Res call(
      {String id,
      String repairShopId,
      String userId,
      String name,
      RepairShopRole role,
      String? profileImageUrl});
}

/// @nodoc
class _$RepairShopUserCopyWithImpl<$Res, $Val extends RepairShopUser>
    implements $RepairShopUserCopyWith<$Res> {
  _$RepairShopUserCopyWithImpl(this._value, this._then);

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
    Object? name = null,
    Object? role = null,
    Object? profileImageUrl = freezed,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as RepairShopRole,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RepairShopUserImplCopyWith<$Res>
    implements $RepairShopUserCopyWith<$Res> {
  factory _$$RepairShopUserImplCopyWith(_$RepairShopUserImpl value,
          $Res Function(_$RepairShopUserImpl) then) =
      __$$RepairShopUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String repairShopId,
      String userId,
      String name,
      RepairShopRole role,
      String? profileImageUrl});
}

/// @nodoc
class __$$RepairShopUserImplCopyWithImpl<$Res>
    extends _$RepairShopUserCopyWithImpl<$Res, _$RepairShopUserImpl>
    implements _$$RepairShopUserImplCopyWith<$Res> {
  __$$RepairShopUserImplCopyWithImpl(
      _$RepairShopUserImpl _value, $Res Function(_$RepairShopUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? repairShopId = null,
    Object? userId = null,
    Object? name = null,
    Object? role = null,
    Object? profileImageUrl = freezed,
  }) {
    return _then(_$RepairShopUserImpl(
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as RepairShopRole,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RepairShopUserImpl implements _RepairShopUser {
  const _$RepairShopUserImpl(
      {required this.id,
      required this.repairShopId,
      required this.userId,
      required this.name,
      required this.role,
      this.profileImageUrl});

  @override
  final String id;
  @override
  final String repairShopId;
  @override
  final String userId;
  @override
  final String name;
  @override
  final RepairShopRole role;
  @override
  final String? profileImageUrl;

  @override
  String toString() {
    return 'RepairShopUser(id: $id, repairShopId: $repairShopId, userId: $userId, name: $name, role: $role, profileImageUrl: $profileImageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepairShopUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.repairShopId, repairShopId) ||
                other.repairShopId == repairShopId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, repairShopId, userId, name, role, profileImageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RepairShopUserImplCopyWith<_$RepairShopUserImpl> get copyWith =>
      __$$RepairShopUserImplCopyWithImpl<_$RepairShopUserImpl>(
          this, _$identity);
}

abstract class _RepairShopUser implements RepairShopUser {
  const factory _RepairShopUser(
      {required final String id,
      required final String repairShopId,
      required final String userId,
      required final String name,
      required final RepairShopRole role,
      final String? profileImageUrl}) = _$RepairShopUserImpl;

  @override
  String get id;
  @override
  String get repairShopId;
  @override
  String get userId;
  @override
  String get name;
  @override
  RepairShopRole get role;
  @override
  String? get profileImageUrl;
  @override
  @JsonKey(ignore: true)
  _$$RepairShopUserImplCopyWith<_$RepairShopUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
