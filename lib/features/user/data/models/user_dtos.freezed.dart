// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateMeRequest _$UpdateMeRequestFromJson(Map<String, dynamic> json) {
  return _UpdateMeRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateMeRequest {
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateMeRequestCopyWith<UpdateMeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateMeRequestCopyWith<$Res> {
  factory $UpdateMeRequestCopyWith(
          UpdateMeRequest value, $Res Function(UpdateMeRequest) then) =
      _$UpdateMeRequestCopyWithImpl<$Res, UpdateMeRequest>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$UpdateMeRequestCopyWithImpl<$Res, $Val extends UpdateMeRequest>
    implements $UpdateMeRequestCopyWith<$Res> {
  _$UpdateMeRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateMeRequestImplCopyWith<$Res>
    implements $UpdateMeRequestCopyWith<$Res> {
  factory _$$UpdateMeRequestImplCopyWith(_$UpdateMeRequestImpl value,
          $Res Function(_$UpdateMeRequestImpl) then) =
      __$$UpdateMeRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$UpdateMeRequestImplCopyWithImpl<$Res>
    extends _$UpdateMeRequestCopyWithImpl<$Res, _$UpdateMeRequestImpl>
    implements _$$UpdateMeRequestImplCopyWith<$Res> {
  __$$UpdateMeRequestImplCopyWithImpl(
      _$UpdateMeRequestImpl _value, $Res Function(_$UpdateMeRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$UpdateMeRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateMeRequestImpl implements _UpdateMeRequest {
  const _$UpdateMeRequestImpl({required this.name});

  factory _$UpdateMeRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateMeRequestImplFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'UpdateMeRequest(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateMeRequestImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateMeRequestImplCopyWith<_$UpdateMeRequestImpl> get copyWith =>
      __$$UpdateMeRequestImplCopyWithImpl<_$UpdateMeRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateMeRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateMeRequest implements UpdateMeRequest {
  const factory _UpdateMeRequest({required final String name}) =
      _$UpdateMeRequestImpl;

  factory _UpdateMeRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateMeRequestImpl.fromJson;

  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$UpdateMeRequestImplCopyWith<_$UpdateMeRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MeResponse _$MeResponseFromJson(Map<String, dynamic> json) {
  return _MeResponse.fromJson(json);
}

/// @nodoc
mixin _$MeResponse {
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MeResponseCopyWith<MeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeResponseCopyWith<$Res> {
  factory $MeResponseCopyWith(
          MeResponse value, $Res Function(MeResponse) then) =
      _$MeResponseCopyWithImpl<$Res, MeResponse>;
  @useResult
  $Res call({String userId, String name, String phoneNumber});
}

/// @nodoc
class _$MeResponseCopyWithImpl<$Res, $Val extends MeResponse>
    implements $MeResponseCopyWith<$Res> {
  _$MeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? name = null,
    Object? phoneNumber = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MeResponseImplCopyWith<$Res>
    implements $MeResponseCopyWith<$Res> {
  factory _$$MeResponseImplCopyWith(
          _$MeResponseImpl value, $Res Function(_$MeResponseImpl) then) =
      __$$MeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String name, String phoneNumber});
}

/// @nodoc
class __$$MeResponseImplCopyWithImpl<$Res>
    extends _$MeResponseCopyWithImpl<$Res, _$MeResponseImpl>
    implements _$$MeResponseImplCopyWith<$Res> {
  __$$MeResponseImplCopyWithImpl(
      _$MeResponseImpl _value, $Res Function(_$MeResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? name = null,
    Object? phoneNumber = null,
  }) {
    return _then(_$MeResponseImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MeResponseImpl implements _MeResponse {
  const _$MeResponseImpl(
      {required this.userId, required this.name, required this.phoneNumber});

  factory _$MeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MeResponseImplFromJson(json);

  @override
  final String userId;
  @override
  final String name;
  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'MeResponse(userId: $userId, name: $name, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeResponseImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, name, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MeResponseImplCopyWith<_$MeResponseImpl> get copyWith =>
      __$$MeResponseImplCopyWithImpl<_$MeResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MeResponseImplToJson(
      this,
    );
  }
}

abstract class _MeResponse implements MeResponse {
  const factory _MeResponse(
      {required final String userId,
      required final String name,
      required final String phoneNumber}) = _$MeResponseImpl;

  factory _MeResponse.fromJson(Map<String, dynamic> json) =
      _$MeResponseImpl.fromJson;

  @override
  String get userId;
  @override
  String get name;
  @override
  String get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$MeResponseImplCopyWith<_$MeResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
