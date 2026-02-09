// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mechanic_dashboard_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateShopRequestDto _$CreateShopRequestDtoFromJson(Map<String, dynamic> json) {
  return _CreateShopRequestDto.fromJson(json);
}

/// @nodoc
mixin _$CreateShopRequestDto {
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateShopRequestDtoCopyWith<CreateShopRequestDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateShopRequestDtoCopyWith<$Res> {
  factory $CreateShopRequestDtoCopyWith(CreateShopRequestDto value,
          $Res Function(CreateShopRequestDto) then) =
      _$CreateShopRequestDtoCopyWithImpl<$Res, CreateShopRequestDto>;
  @useResult
  $Res call(
      {String name,
      String address,
      String phoneNumber,
      String? profileImageUrl});
}

/// @nodoc
class _$CreateShopRequestDtoCopyWithImpl<$Res,
        $Val extends CreateShopRequestDto>
    implements $CreateShopRequestDtoCopyWith<$Res> {
  _$CreateShopRequestDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? address = null,
    Object? phoneNumber = null,
    Object? profileImageUrl = freezed,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$CreateShopRequestDtoImplCopyWith<$Res>
    implements $CreateShopRequestDtoCopyWith<$Res> {
  factory _$$CreateShopRequestDtoImplCopyWith(_$CreateShopRequestDtoImpl value,
          $Res Function(_$CreateShopRequestDtoImpl) then) =
      __$$CreateShopRequestDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String address,
      String phoneNumber,
      String? profileImageUrl});
}

/// @nodoc
class __$$CreateShopRequestDtoImplCopyWithImpl<$Res>
    extends _$CreateShopRequestDtoCopyWithImpl<$Res, _$CreateShopRequestDtoImpl>
    implements _$$CreateShopRequestDtoImplCopyWith<$Res> {
  __$$CreateShopRequestDtoImplCopyWithImpl(_$CreateShopRequestDtoImpl _value,
      $Res Function(_$CreateShopRequestDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? address = null,
    Object? phoneNumber = null,
    Object? profileImageUrl = freezed,
  }) {
    return _then(_$CreateShopRequestDtoImpl(
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
class _$CreateShopRequestDtoImpl implements _CreateShopRequestDto {
  const _$CreateShopRequestDtoImpl(
      {required this.name,
      required this.address,
      required this.phoneNumber,
      this.profileImageUrl});

  factory _$CreateShopRequestDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateShopRequestDtoImplFromJson(json);

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
    return 'CreateShopRequestDto(name: $name, address: $address, phoneNumber: $phoneNumber, profileImageUrl: $profileImageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateShopRequestDtoImpl &&
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
      Object.hash(runtimeType, name, address, phoneNumber, profileImageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateShopRequestDtoImplCopyWith<_$CreateShopRequestDtoImpl>
      get copyWith =>
          __$$CreateShopRequestDtoImplCopyWithImpl<_$CreateShopRequestDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateShopRequestDtoImplToJson(
      this,
    );
  }
}

abstract class _CreateShopRequestDto implements CreateShopRequestDto {
  const factory _CreateShopRequestDto(
      {required final String name,
      required final String address,
      required final String phoneNumber,
      final String? profileImageUrl}) = _$CreateShopRequestDtoImpl;

  factory _CreateShopRequestDto.fromJson(Map<String, dynamic> json) =
      _$CreateShopRequestDtoImpl.fromJson;

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
  _$$CreateShopRequestDtoImplCopyWith<_$CreateShopRequestDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

RepairShopResponseDto _$RepairShopResponseDtoFromJson(
    Map<String, dynamic> json) {
  return _RepairShopResponseDto.fromJson(json);
}

/// @nodoc
mixin _$RepairShopResponseDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepairShopResponseDtoCopyWith<RepairShopResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepairShopResponseDtoCopyWith<$Res> {
  factory $RepairShopResponseDtoCopyWith(RepairShopResponseDto value,
          $Res Function(RepairShopResponseDto) then) =
      _$RepairShopResponseDtoCopyWithImpl<$Res, RepairShopResponseDto>;
  @useResult
  $Res call(
      {String id,
      String name,
      String address,
      String phoneNumber,
      String? profileImageUrl});
}

/// @nodoc
class _$RepairShopResponseDtoCopyWithImpl<$Res,
        $Val extends RepairShopResponseDto>
    implements $RepairShopResponseDtoCopyWith<$Res> {
  _$RepairShopResponseDtoCopyWithImpl(this._value, this._then);

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
              as String,
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
abstract class _$$RepairShopResponseDtoImplCopyWith<$Res>
    implements $RepairShopResponseDtoCopyWith<$Res> {
  factory _$$RepairShopResponseDtoImplCopyWith(
          _$RepairShopResponseDtoImpl value,
          $Res Function(_$RepairShopResponseDtoImpl) then) =
      __$$RepairShopResponseDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String address,
      String phoneNumber,
      String? profileImageUrl});
}

/// @nodoc
class __$$RepairShopResponseDtoImplCopyWithImpl<$Res>
    extends _$RepairShopResponseDtoCopyWithImpl<$Res,
        _$RepairShopResponseDtoImpl>
    implements _$$RepairShopResponseDtoImplCopyWith<$Res> {
  __$$RepairShopResponseDtoImplCopyWithImpl(_$RepairShopResponseDtoImpl _value,
      $Res Function(_$RepairShopResponseDtoImpl) _then)
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
    return _then(_$RepairShopResponseDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$RepairShopResponseDtoImpl implements _RepairShopResponseDto {
  const _$RepairShopResponseDtoImpl(
      {required this.id,
      required this.name,
      required this.address,
      required this.phoneNumber,
      this.profileImageUrl});

  factory _$RepairShopResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepairShopResponseDtoImplFromJson(json);

  @override
  final String id;
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
    return 'RepairShopResponseDto(id: $id, name: $name, address: $address, phoneNumber: $phoneNumber, profileImageUrl: $profileImageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepairShopResponseDtoImpl &&
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
  _$$RepairShopResponseDtoImplCopyWith<_$RepairShopResponseDtoImpl>
      get copyWith => __$$RepairShopResponseDtoImplCopyWithImpl<
          _$RepairShopResponseDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepairShopResponseDtoImplToJson(
      this,
    );
  }
}

abstract class _RepairShopResponseDto implements RepairShopResponseDto {
  const factory _RepairShopResponseDto(
      {required final String id,
      required final String name,
      required final String address,
      required final String phoneNumber,
      final String? profileImageUrl}) = _$RepairShopResponseDtoImpl;

  factory _RepairShopResponseDto.fromJson(Map<String, dynamic> json) =
      _$RepairShopResponseDtoImpl.fromJson;

  @override
  String get id;
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
  _$$RepairShopResponseDtoImplCopyWith<_$RepairShopResponseDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
