// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repair_shop.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RepairShop _$RepairShopFromJson(Map<String, dynamic> json) {
  return _RepairShop.fromJson(json);
}

/// @nodoc
mixin _$RepairShop {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepairShopCopyWith<RepairShop> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepairShopCopyWith<$Res> {
  factory $RepairShopCopyWith(
          RepairShop value, $Res Function(RepairShop) then) =
      _$RepairShopCopyWithImpl<$Res, RepairShop>;
  @useResult
  $Res call(
      {int id,
      String name,
      String address,
      String phoneNumber,
      String? profileImageUrl});
}

/// @nodoc
class _$RepairShopCopyWithImpl<$Res, $Val extends RepairShop>
    implements $RepairShopCopyWith<$Res> {
  _$RepairShopCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? phoneNumber = null,
    Object? profileImageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RepairShopImplCopyWith<$Res>
    implements $RepairShopCopyWith<$Res> {
  factory _$$RepairShopImplCopyWith(
          _$RepairShopImpl value, $Res Function(_$RepairShopImpl) then) =
      __$$RepairShopImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String address,
      String phoneNumber,
      String? profileImageUrl});
}

/// @nodoc
class __$$RepairShopImplCopyWithImpl<$Res>
    extends _$RepairShopCopyWithImpl<$Res, _$RepairShopImpl>
    implements _$$RepairShopImplCopyWith<$Res> {
  __$$RepairShopImplCopyWithImpl(
      _$RepairShopImpl _value, $Res Function(_$RepairShopImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? phoneNumber = null,
    Object? profileImageUrl = freezed,
  }) {
    return _then(_$RepairShopImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepairShopImpl implements _RepairShop {
  const _$RepairShopImpl(
      {required this.id,
      required this.name,
      required this.address,
      required this.phoneNumber,
      this.profileImageUrl});

  factory _$RepairShopImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepairShopImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String address;
  @override
  final String phoneNumber;
  @override
  final String? profileImageUrl;

  @override
  String toString() {
    return 'RepairShop(id: $id, name: $name, address: $address, phoneNumber: $phoneNumber, profileImageUrl: $profileImageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepairShopImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, address, phoneNumber, profileImageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RepairShopImplCopyWith<_$RepairShopImpl> get copyWith =>
      __$$RepairShopImplCopyWithImpl<_$RepairShopImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepairShopImplToJson(
      this,
    );
  }
}

abstract class _RepairShop implements RepairShop {
  const factory _RepairShop(
      {required final int id,
      required final String name,
      required final String address,
      required final String phoneNumber,
      final String? profileImageUrl}) = _$RepairShopImpl;

  factory _RepairShop.fromJson(Map<String, dynamic> json) =
      _$RepairShopImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get address;
  @override
  String get phoneNumber;
  @override
  String? get profileImageUrl;
  @override
  @JsonKey(ignore: true)
  _$$RepairShopImplCopyWith<_$RepairShopImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
