// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SendSmsCodeRequest _$SendSmsCodeRequestFromJson(Map<String, dynamic> json) {
  return _SendSmsCodeRequest.fromJson(json);
}

/// @nodoc
mixin _$SendSmsCodeRequest {
  String get phoneNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SendSmsCodeRequestCopyWith<SendSmsCodeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendSmsCodeRequestCopyWith<$Res> {
  factory $SendSmsCodeRequestCopyWith(
          SendSmsCodeRequest value, $Res Function(SendSmsCodeRequest) then) =
      _$SendSmsCodeRequestCopyWithImpl<$Res, SendSmsCodeRequest>;
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class _$SendSmsCodeRequestCopyWithImpl<$Res, $Val extends SendSmsCodeRequest>
    implements $SendSmsCodeRequestCopyWith<$Res> {
  _$SendSmsCodeRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_value.copyWith(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendSmsCodeRequestImplCopyWith<$Res>
    implements $SendSmsCodeRequestCopyWith<$Res> {
  factory _$$SendSmsCodeRequestImplCopyWith(_$SendSmsCodeRequestImpl value,
          $Res Function(_$SendSmsCodeRequestImpl) then) =
      __$$SendSmsCodeRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class __$$SendSmsCodeRequestImplCopyWithImpl<$Res>
    extends _$SendSmsCodeRequestCopyWithImpl<$Res, _$SendSmsCodeRequestImpl>
    implements _$$SendSmsCodeRequestImplCopyWith<$Res> {
  __$$SendSmsCodeRequestImplCopyWithImpl(_$SendSmsCodeRequestImpl _value,
      $Res Function(_$SendSmsCodeRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_$SendSmsCodeRequestImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SendSmsCodeRequestImpl implements _SendSmsCodeRequest {
  const _$SendSmsCodeRequestImpl({required this.phoneNumber});

  factory _$SendSmsCodeRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendSmsCodeRequestImplFromJson(json);

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'SendSmsCodeRequest(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendSmsCodeRequestImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendSmsCodeRequestImplCopyWith<_$SendSmsCodeRequestImpl> get copyWith =>
      __$$SendSmsCodeRequestImplCopyWithImpl<_$SendSmsCodeRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SendSmsCodeRequestImplToJson(
      this,
    );
  }
}

abstract class _SendSmsCodeRequest implements SendSmsCodeRequest {
  const factory _SendSmsCodeRequest({required final String phoneNumber}) =
      _$SendSmsCodeRequestImpl;

  factory _SendSmsCodeRequest.fromJson(Map<String, dynamic> json) =
      _$SendSmsCodeRequestImpl.fromJson;

  @override
  String get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$SendSmsCodeRequestImplCopyWith<_$SendSmsCodeRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SendSmsCodeResponse _$SendSmsCodeResponseFromJson(Map<String, dynamic> json) {
  return _SendSmsCodeResponse.fromJson(json);
}

/// @nodoc
mixin _$SendSmsCodeResponse {
  int get expireSeconds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SendSmsCodeResponseCopyWith<SendSmsCodeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendSmsCodeResponseCopyWith<$Res> {
  factory $SendSmsCodeResponseCopyWith(
          SendSmsCodeResponse value, $Res Function(SendSmsCodeResponse) then) =
      _$SendSmsCodeResponseCopyWithImpl<$Res, SendSmsCodeResponse>;
  @useResult
  $Res call({int expireSeconds});
}

/// @nodoc
class _$SendSmsCodeResponseCopyWithImpl<$Res, $Val extends SendSmsCodeResponse>
    implements $SendSmsCodeResponseCopyWith<$Res> {
  _$SendSmsCodeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expireSeconds = null,
  }) {
    return _then(_value.copyWith(
      expireSeconds: null == expireSeconds
          ? _value.expireSeconds
          : expireSeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendSmsCodeResponseImplCopyWith<$Res>
    implements $SendSmsCodeResponseCopyWith<$Res> {
  factory _$$SendSmsCodeResponseImplCopyWith(_$SendSmsCodeResponseImpl value,
          $Res Function(_$SendSmsCodeResponseImpl) then) =
      __$$SendSmsCodeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int expireSeconds});
}

/// @nodoc
class __$$SendSmsCodeResponseImplCopyWithImpl<$Res>
    extends _$SendSmsCodeResponseCopyWithImpl<$Res, _$SendSmsCodeResponseImpl>
    implements _$$SendSmsCodeResponseImplCopyWith<$Res> {
  __$$SendSmsCodeResponseImplCopyWithImpl(_$SendSmsCodeResponseImpl _value,
      $Res Function(_$SendSmsCodeResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expireSeconds = null,
  }) {
    return _then(_$SendSmsCodeResponseImpl(
      expireSeconds: null == expireSeconds
          ? _value.expireSeconds
          : expireSeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SendSmsCodeResponseImpl implements _SendSmsCodeResponse {
  const _$SendSmsCodeResponseImpl({required this.expireSeconds});

  factory _$SendSmsCodeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendSmsCodeResponseImplFromJson(json);

  @override
  final int expireSeconds;

  @override
  String toString() {
    return 'SendSmsCodeResponse(expireSeconds: $expireSeconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendSmsCodeResponseImpl &&
            (identical(other.expireSeconds, expireSeconds) ||
                other.expireSeconds == expireSeconds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, expireSeconds);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SendSmsCodeResponseImplCopyWith<_$SendSmsCodeResponseImpl> get copyWith =>
      __$$SendSmsCodeResponseImplCopyWithImpl<_$SendSmsCodeResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SendSmsCodeResponseImplToJson(
      this,
    );
  }
}

abstract class _SendSmsCodeResponse implements SendSmsCodeResponse {
  const factory _SendSmsCodeResponse({required final int expireSeconds}) =
      _$SendSmsCodeResponseImpl;

  factory _SendSmsCodeResponse.fromJson(Map<String, dynamic> json) =
      _$SendSmsCodeResponseImpl.fromJson;

  @override
  int get expireSeconds;
  @override
  @JsonKey(ignore: true)
  _$$SendSmsCodeResponseImplCopyWith<_$SendSmsCodeResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VerifySmsCodeRequest _$VerifySmsCodeRequestFromJson(Map<String, dynamic> json) {
  return _VerifySmsCodeRequest.fromJson(json);
}

/// @nodoc
mixin _$VerifySmsCodeRequest {
  String get phoneNumber => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifySmsCodeRequestCopyWith<VerifySmsCodeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifySmsCodeRequestCopyWith<$Res> {
  factory $VerifySmsCodeRequestCopyWith(VerifySmsCodeRequest value,
          $Res Function(VerifySmsCodeRequest) then) =
      _$VerifySmsCodeRequestCopyWithImpl<$Res, VerifySmsCodeRequest>;
  @useResult
  $Res call({String phoneNumber, String code});
}

/// @nodoc
class _$VerifySmsCodeRequestCopyWithImpl<$Res,
        $Val extends VerifySmsCodeRequest>
    implements $VerifySmsCodeRequestCopyWith<$Res> {
  _$VerifySmsCodeRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifySmsCodeRequestImplCopyWith<$Res>
    implements $VerifySmsCodeRequestCopyWith<$Res> {
  factory _$$VerifySmsCodeRequestImplCopyWith(_$VerifySmsCodeRequestImpl value,
          $Res Function(_$VerifySmsCodeRequestImpl) then) =
      __$$VerifySmsCodeRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phoneNumber, String code});
}

/// @nodoc
class __$$VerifySmsCodeRequestImplCopyWithImpl<$Res>
    extends _$VerifySmsCodeRequestCopyWithImpl<$Res, _$VerifySmsCodeRequestImpl>
    implements _$$VerifySmsCodeRequestImplCopyWith<$Res> {
  __$$VerifySmsCodeRequestImplCopyWithImpl(_$VerifySmsCodeRequestImpl _value,
      $Res Function(_$VerifySmsCodeRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? code = null,
  }) {
    return _then(_$VerifySmsCodeRequestImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifySmsCodeRequestImpl implements _VerifySmsCodeRequest {
  const _$VerifySmsCodeRequestImpl(
      {required this.phoneNumber, required this.code});

  factory _$VerifySmsCodeRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifySmsCodeRequestImplFromJson(json);

  @override
  final String phoneNumber;
  @override
  final String code;

  @override
  String toString() {
    return 'VerifySmsCodeRequest(phoneNumber: $phoneNumber, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifySmsCodeRequestImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifySmsCodeRequestImplCopyWith<_$VerifySmsCodeRequestImpl>
      get copyWith =>
          __$$VerifySmsCodeRequestImplCopyWithImpl<_$VerifySmsCodeRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifySmsCodeRequestImplToJson(
      this,
    );
  }
}

abstract class _VerifySmsCodeRequest implements VerifySmsCodeRequest {
  const factory _VerifySmsCodeRequest(
      {required final String phoneNumber,
      required final String code}) = _$VerifySmsCodeRequestImpl;

  factory _VerifySmsCodeRequest.fromJson(Map<String, dynamic> json) =
      _$VerifySmsCodeRequestImpl.fromJson;

  @override
  String get phoneNumber;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$VerifySmsCodeRequestImplCopyWith<_$VerifySmsCodeRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

VerifySmsCodeResponse _$VerifySmsCodeResponseFromJson(
    Map<String, dynamic> json) {
  return _VerifySmsCodeResponse.fromJson(json);
}

/// @nodoc
mixin _$VerifySmsCodeResponse {
  bool get verified => throw _privateConstructorUsedError;
  String? get phoneNumberVerificationToken =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerifySmsCodeResponseCopyWith<VerifySmsCodeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifySmsCodeResponseCopyWith<$Res> {
  factory $VerifySmsCodeResponseCopyWith(VerifySmsCodeResponse value,
          $Res Function(VerifySmsCodeResponse) then) =
      _$VerifySmsCodeResponseCopyWithImpl<$Res, VerifySmsCodeResponse>;
  @useResult
  $Res call({bool verified, String? phoneNumberVerificationToken});
}

/// @nodoc
class _$VerifySmsCodeResponseCopyWithImpl<$Res,
        $Val extends VerifySmsCodeResponse>
    implements $VerifySmsCodeResponseCopyWith<$Res> {
  _$VerifySmsCodeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verified = null,
    Object? phoneNumberVerificationToken = freezed,
  }) {
    return _then(_value.copyWith(
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneNumberVerificationToken: freezed == phoneNumberVerificationToken
          ? _value.phoneNumberVerificationToken
          : phoneNumberVerificationToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifySmsCodeResponseImplCopyWith<$Res>
    implements $VerifySmsCodeResponseCopyWith<$Res> {
  factory _$$VerifySmsCodeResponseImplCopyWith(
          _$VerifySmsCodeResponseImpl value,
          $Res Function(_$VerifySmsCodeResponseImpl) then) =
      __$$VerifySmsCodeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool verified, String? phoneNumberVerificationToken});
}

/// @nodoc
class __$$VerifySmsCodeResponseImplCopyWithImpl<$Res>
    extends _$VerifySmsCodeResponseCopyWithImpl<$Res,
        _$VerifySmsCodeResponseImpl>
    implements _$$VerifySmsCodeResponseImplCopyWith<$Res> {
  __$$VerifySmsCodeResponseImplCopyWithImpl(_$VerifySmsCodeResponseImpl _value,
      $Res Function(_$VerifySmsCodeResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verified = null,
    Object? phoneNumberVerificationToken = freezed,
  }) {
    return _then(_$VerifySmsCodeResponseImpl(
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneNumberVerificationToken: freezed == phoneNumberVerificationToken
          ? _value.phoneNumberVerificationToken
          : phoneNumberVerificationToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerifySmsCodeResponseImpl implements _VerifySmsCodeResponse {
  const _$VerifySmsCodeResponseImpl(
      {required this.verified, this.phoneNumberVerificationToken});

  factory _$VerifySmsCodeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerifySmsCodeResponseImplFromJson(json);

  @override
  final bool verified;
  @override
  final String? phoneNumberVerificationToken;

  @override
  String toString() {
    return 'VerifySmsCodeResponse(verified: $verified, phoneNumberVerificationToken: $phoneNumberVerificationToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifySmsCodeResponseImpl &&
            (identical(other.verified, verified) ||
                other.verified == verified) &&
            (identical(other.phoneNumberVerificationToken,
                    phoneNumberVerificationToken) ||
                other.phoneNumberVerificationToken ==
                    phoneNumberVerificationToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, verified, phoneNumberVerificationToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifySmsCodeResponseImplCopyWith<_$VerifySmsCodeResponseImpl>
      get copyWith => __$$VerifySmsCodeResponseImplCopyWithImpl<
          _$VerifySmsCodeResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerifySmsCodeResponseImplToJson(
      this,
    );
  }
}

abstract class _VerifySmsCodeResponse implements VerifySmsCodeResponse {
  const factory _VerifySmsCodeResponse(
          {required final bool verified,
          final String? phoneNumberVerificationToken}) =
      _$VerifySmsCodeResponseImpl;

  factory _VerifySmsCodeResponse.fromJson(Map<String, dynamic> json) =
      _$VerifySmsCodeResponseImpl.fromJson;

  @override
  bool get verified;
  @override
  String? get phoneNumberVerificationToken;
  @override
  @JsonKey(ignore: true)
  _$$VerifySmsCodeResponseImplCopyWith<_$VerifySmsCodeResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) {
  return _LoginRequest.fromJson(json);
}

/// @nodoc
mixin _$LoginRequest {
  String get phoneNumber => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginRequestCopyWith<LoginRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginRequestCopyWith<$Res> {
  factory $LoginRequestCopyWith(
          LoginRequest value, $Res Function(LoginRequest) then) =
      _$LoginRequestCopyWithImpl<$Res, LoginRequest>;
  @useResult
  $Res call({String phoneNumber, String username, String password});
}

/// @nodoc
class _$LoginRequestCopyWithImpl<$Res, $Val extends LoginRequest>
    implements $LoginRequestCopyWith<$Res> {
  _$LoginRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginRequestImplCopyWith<$Res>
    implements $LoginRequestCopyWith<$Res> {
  factory _$$LoginRequestImplCopyWith(
          _$LoginRequestImpl value, $Res Function(_$LoginRequestImpl) then) =
      __$$LoginRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phoneNumber, String username, String password});
}

/// @nodoc
class __$$LoginRequestImplCopyWithImpl<$Res>
    extends _$LoginRequestCopyWithImpl<$Res, _$LoginRequestImpl>
    implements _$$LoginRequestImplCopyWith<$Res> {
  __$$LoginRequestImplCopyWithImpl(
      _$LoginRequestImpl _value, $Res Function(_$LoginRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_$LoginRequestImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginRequestImpl implements _LoginRequest {
  const _$LoginRequestImpl(
      {required this.phoneNumber,
      required this.username,
      required this.password});

  factory _$LoginRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginRequestImplFromJson(json);

  @override
  final String phoneNumber;
  @override
  final String username;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginRequest(phoneNumber: $phoneNumber, username: $username, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginRequestImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, username, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginRequestImplCopyWith<_$LoginRequestImpl> get copyWith =>
      __$$LoginRequestImplCopyWithImpl<_$LoginRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginRequestImplToJson(
      this,
    );
  }
}

abstract class _LoginRequest implements LoginRequest {
  const factory _LoginRequest(
      {required final String phoneNumber,
      required final String username,
      required final String password}) = _$LoginRequestImpl;

  factory _LoginRequest.fromJson(Map<String, dynamic> json) =
      _$LoginRequestImpl.fromJson;

  @override
  String get phoneNumber;
  @override
  String get username;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$LoginRequestImplCopyWith<_$LoginRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return _LoginResponse.fromJson(json);
}

/// @nodoc
mixin _$LoginResponse {
  UserDto get user => throw _privateConstructorUsedError; // We need UserDto
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginResponseCopyWith<LoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResponseCopyWith<$Res> {
  factory $LoginResponseCopyWith(
          LoginResponse value, $Res Function(LoginResponse) then) =
      _$LoginResponseCopyWithImpl<$Res, LoginResponse>;
  @useResult
  $Res call({UserDto user, String accessToken, String refreshToken});

  $UserDtoCopyWith<$Res> get user;
}

/// @nodoc
class _$LoginResponseCopyWithImpl<$Res, $Val extends LoginResponse>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<$Res> get user {
    return $UserDtoCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginResponseImplCopyWith<$Res>
    implements $LoginResponseCopyWith<$Res> {
  factory _$$LoginResponseImplCopyWith(
          _$LoginResponseImpl value, $Res Function(_$LoginResponseImpl) then) =
      __$$LoginResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserDto user, String accessToken, String refreshToken});

  @override
  $UserDtoCopyWith<$Res> get user;
}

/// @nodoc
class __$$LoginResponseImplCopyWithImpl<$Res>
    extends _$LoginResponseCopyWithImpl<$Res, _$LoginResponseImpl>
    implements _$$LoginResponseImplCopyWith<$Res> {
  __$$LoginResponseImplCopyWithImpl(
      _$LoginResponseImpl _value, $Res Function(_$LoginResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_$LoginResponseImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDto,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginResponseImpl implements _LoginResponse {
  const _$LoginResponseImpl(
      {required this.user,
      required this.accessToken,
      required this.refreshToken});

  factory _$LoginResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginResponseImplFromJson(json);

  @override
  final UserDto user;
// We need UserDto
  @override
  final String accessToken;
  @override
  final String refreshToken;

  @override
  String toString() {
    return 'LoginResponse(user: $user, accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginResponseImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user, accessToken, refreshToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      __$$LoginResponseImplCopyWithImpl<_$LoginResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginResponseImplToJson(
      this,
    );
  }
}

abstract class _LoginResponse implements LoginResponse {
  const factory _LoginResponse(
      {required final UserDto user,
      required final String accessToken,
      required final String refreshToken}) = _$LoginResponseImpl;

  factory _LoginResponse.fromJson(Map<String, dynamic> json) =
      _$LoginResponseImpl.fromJson;

  @override
  UserDto get user;
  @override // We need UserDto
  String get accessToken;
  @override
  String get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RefreshTokenRequest _$RefreshTokenRequestFromJson(Map<String, dynamic> json) {
  return _RefreshTokenRequest.fromJson(json);
}

/// @nodoc
mixin _$RefreshTokenRequest {
  String get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RefreshTokenRequestCopyWith<RefreshTokenRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshTokenRequestCopyWith<$Res> {
  factory $RefreshTokenRequestCopyWith(
          RefreshTokenRequest value, $Res Function(RefreshTokenRequest) then) =
      _$RefreshTokenRequestCopyWithImpl<$Res, RefreshTokenRequest>;
  @useResult
  $Res call({String refreshToken});
}

/// @nodoc
class _$RefreshTokenRequestCopyWithImpl<$Res, $Val extends RefreshTokenRequest>
    implements $RefreshTokenRequestCopyWith<$Res> {
  _$RefreshTokenRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refreshToken = null,
  }) {
    return _then(_value.copyWith(
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RefreshTokenRequestImplCopyWith<$Res>
    implements $RefreshTokenRequestCopyWith<$Res> {
  factory _$$RefreshTokenRequestImplCopyWith(_$RefreshTokenRequestImpl value,
          $Res Function(_$RefreshTokenRequestImpl) then) =
      __$$RefreshTokenRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String refreshToken});
}

/// @nodoc
class __$$RefreshTokenRequestImplCopyWithImpl<$Res>
    extends _$RefreshTokenRequestCopyWithImpl<$Res, _$RefreshTokenRequestImpl>
    implements _$$RefreshTokenRequestImplCopyWith<$Res> {
  __$$RefreshTokenRequestImplCopyWithImpl(_$RefreshTokenRequestImpl _value,
      $Res Function(_$RefreshTokenRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refreshToken = null,
  }) {
    return _then(_$RefreshTokenRequestImpl(
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RefreshTokenRequestImpl implements _RefreshTokenRequest {
  const _$RefreshTokenRequestImpl({required this.refreshToken});

  factory _$RefreshTokenRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefreshTokenRequestImplFromJson(json);

  @override
  final String refreshToken;

  @override
  String toString() {
    return 'RefreshTokenRequest(refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshTokenRequestImpl &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, refreshToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshTokenRequestImplCopyWith<_$RefreshTokenRequestImpl> get copyWith =>
      __$$RefreshTokenRequestImplCopyWithImpl<_$RefreshTokenRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RefreshTokenRequestImplToJson(
      this,
    );
  }
}

abstract class _RefreshTokenRequest implements RefreshTokenRequest {
  const factory _RefreshTokenRequest({required final String refreshToken}) =
      _$RefreshTokenRequestImpl;

  factory _RefreshTokenRequest.fromJson(Map<String, dynamic> json) =
      _$RefreshTokenRequestImpl.fromJson;

  @override
  String get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$$RefreshTokenRequestImplCopyWith<_$RefreshTokenRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RefreshTokenResponse _$RefreshTokenResponseFromJson(Map<String, dynamic> json) {
  return _RefreshTokenResponse.fromJson(json);
}

/// @nodoc
mixin _$RefreshTokenResponse {
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RefreshTokenResponseCopyWith<RefreshTokenResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshTokenResponseCopyWith<$Res> {
  factory $RefreshTokenResponseCopyWith(RefreshTokenResponse value,
          $Res Function(RefreshTokenResponse) then) =
      _$RefreshTokenResponseCopyWithImpl<$Res, RefreshTokenResponse>;
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class _$RefreshTokenResponseCopyWithImpl<$Res,
        $Val extends RefreshTokenResponse>
    implements $RefreshTokenResponseCopyWith<$Res> {
  _$RefreshTokenResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RefreshTokenResponseImplCopyWith<$Res>
    implements $RefreshTokenResponseCopyWith<$Res> {
  factory _$$RefreshTokenResponseImplCopyWith(_$RefreshTokenResponseImpl value,
          $Res Function(_$RefreshTokenResponseImpl) then) =
      __$$RefreshTokenResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class __$$RefreshTokenResponseImplCopyWithImpl<$Res>
    extends _$RefreshTokenResponseCopyWithImpl<$Res, _$RefreshTokenResponseImpl>
    implements _$$RefreshTokenResponseImplCopyWith<$Res> {
  __$$RefreshTokenResponseImplCopyWithImpl(_$RefreshTokenResponseImpl _value,
      $Res Function(_$RefreshTokenResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_$RefreshTokenResponseImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RefreshTokenResponseImpl implements _RefreshTokenResponse {
  const _$RefreshTokenResponseImpl(
      {required this.accessToken, required this.refreshToken});

  factory _$RefreshTokenResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RefreshTokenResponseImplFromJson(json);

  @override
  final String accessToken;
  @override
  final String refreshToken;

  @override
  String toString() {
    return 'RefreshTokenResponse(accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshTokenResponseImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshTokenResponseImplCopyWith<_$RefreshTokenResponseImpl>
      get copyWith =>
          __$$RefreshTokenResponseImplCopyWithImpl<_$RefreshTokenResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RefreshTokenResponseImplToJson(
      this,
    );
  }
}

abstract class _RefreshTokenResponse implements RefreshTokenResponse {
  const factory _RefreshTokenResponse(
      {required final String accessToken,
      required final String refreshToken}) = _$RefreshTokenResponseImpl;

  factory _RefreshTokenResponse.fromJson(Map<String, dynamic> json) =
      _$RefreshTokenResponseImpl.fromJson;

  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$$RefreshTokenResponseImplCopyWith<_$RefreshTokenResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SignupRequest _$SignupRequestFromJson(Map<String, dynamic> json) {
  return _SignupRequest.fromJson(json);
}

/// @nodoc
mixin _$SignupRequest {
  String get phoneNumber => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get passwordConfirmation => throw _privateConstructorUsedError;
  String get phoneNumberVerificationToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignupRequestCopyWith<SignupRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupRequestCopyWith<$Res> {
  factory $SignupRequestCopyWith(
          SignupRequest value, $Res Function(SignupRequest) then) =
      _$SignupRequestCopyWithImpl<$Res, SignupRequest>;
  @useResult
  $Res call(
      {String phoneNumber,
      String username,
      String password,
      String passwordConfirmation,
      String phoneNumberVerificationToken});
}

/// @nodoc
class _$SignupRequestCopyWithImpl<$Res, $Val extends SignupRequest>
    implements $SignupRequestCopyWith<$Res> {
  _$SignupRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? username = null,
    Object? password = null,
    Object? passwordConfirmation = null,
    Object? phoneNumberVerificationToken = null,
  }) {
    return _then(_value.copyWith(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      passwordConfirmation: null == passwordConfirmation
          ? _value.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumberVerificationToken: null == phoneNumberVerificationToken
          ? _value.phoneNumberVerificationToken
          : phoneNumberVerificationToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignupRequestImplCopyWith<$Res>
    implements $SignupRequestCopyWith<$Res> {
  factory _$$SignupRequestImplCopyWith(
          _$SignupRequestImpl value, $Res Function(_$SignupRequestImpl) then) =
      __$$SignupRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String phoneNumber,
      String username,
      String password,
      String passwordConfirmation,
      String phoneNumberVerificationToken});
}

/// @nodoc
class __$$SignupRequestImplCopyWithImpl<$Res>
    extends _$SignupRequestCopyWithImpl<$Res, _$SignupRequestImpl>
    implements _$$SignupRequestImplCopyWith<$Res> {
  __$$SignupRequestImplCopyWithImpl(
      _$SignupRequestImpl _value, $Res Function(_$SignupRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? username = null,
    Object? password = null,
    Object? passwordConfirmation = null,
    Object? phoneNumberVerificationToken = null,
  }) {
    return _then(_$SignupRequestImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      passwordConfirmation: null == passwordConfirmation
          ? _value.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumberVerificationToken: null == phoneNumberVerificationToken
          ? _value.phoneNumberVerificationToken
          : phoneNumberVerificationToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignupRequestImpl implements _SignupRequest {
  const _$SignupRequestImpl(
      {required this.phoneNumber,
      required this.username,
      required this.password,
      required this.passwordConfirmation,
      required this.phoneNumberVerificationToken});

  factory _$SignupRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignupRequestImplFromJson(json);

  @override
  final String phoneNumber;
  @override
  final String username;
  @override
  final String password;
  @override
  final String passwordConfirmation;
  @override
  final String phoneNumberVerificationToken;

  @override
  String toString() {
    return 'SignupRequest(phoneNumber: $phoneNumber, username: $username, password: $password, passwordConfirmation: $passwordConfirmation, phoneNumberVerificationToken: $phoneNumberVerificationToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupRequestImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passwordConfirmation, passwordConfirmation) ||
                other.passwordConfirmation == passwordConfirmation) &&
            (identical(other.phoneNumberVerificationToken,
                    phoneNumberVerificationToken) ||
                other.phoneNumberVerificationToken ==
                    phoneNumberVerificationToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, username, password,
      passwordConfirmation, phoneNumberVerificationToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupRequestImplCopyWith<_$SignupRequestImpl> get copyWith =>
      __$$SignupRequestImplCopyWithImpl<_$SignupRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignupRequestImplToJson(
      this,
    );
  }
}

abstract class _SignupRequest implements SignupRequest {
  const factory _SignupRequest(
          {required final String phoneNumber,
          required final String username,
          required final String password,
          required final String passwordConfirmation,
          required final String phoneNumberVerificationToken}) =
      _$SignupRequestImpl;

  factory _SignupRequest.fromJson(Map<String, dynamic> json) =
      _$SignupRequestImpl.fromJson;

  @override
  String get phoneNumber;
  @override
  String get username;
  @override
  String get password;
  @override
  String get passwordConfirmation;
  @override
  String get phoneNumberVerificationToken;
  @override
  @JsonKey(ignore: true)
  _$$SignupRequestImplCopyWith<_$SignupRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SignupResponse _$SignupResponseFromJson(Map<String, dynamic> json) {
  return _SignupResponse.fromJson(json);
}

/// @nodoc
mixin _$SignupResponse {
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignupResponseCopyWith<SignupResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupResponseCopyWith<$Res> {
  factory $SignupResponseCopyWith(
          SignupResponse value, $Res Function(SignupResponse) then) =
      _$SignupResponseCopyWithImpl<$Res, SignupResponse>;
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class _$SignupResponseCopyWithImpl<$Res, $Val extends SignupResponse>
    implements $SignupResponseCopyWith<$Res> {
  _$SignupResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignupResponseImplCopyWith<$Res>
    implements $SignupResponseCopyWith<$Res> {
  factory _$$SignupResponseImplCopyWith(_$SignupResponseImpl value,
          $Res Function(_$SignupResponseImpl) then) =
      __$$SignupResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class __$$SignupResponseImplCopyWithImpl<$Res>
    extends _$SignupResponseCopyWithImpl<$Res, _$SignupResponseImpl>
    implements _$$SignupResponseImplCopyWith<$Res> {
  __$$SignupResponseImplCopyWithImpl(
      _$SignupResponseImpl _value, $Res Function(_$SignupResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_$SignupResponseImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignupResponseImpl implements _SignupResponse {
  const _$SignupResponseImpl(
      {required this.accessToken, required this.refreshToken});

  factory _$SignupResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignupResponseImplFromJson(json);

  @override
  final String accessToken;
  @override
  final String refreshToken;

  @override
  String toString() {
    return 'SignupResponse(accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupResponseImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupResponseImplCopyWith<_$SignupResponseImpl> get copyWith =>
      __$$SignupResponseImplCopyWithImpl<_$SignupResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignupResponseImplToJson(
      this,
    );
  }
}

abstract class _SignupResponse implements SignupResponse {
  const factory _SignupResponse(
      {required final String accessToken,
      required final String refreshToken}) = _$SignupResponseImpl;

  factory _SignupResponse.fromJson(Map<String, dynamic> json) =
      _$SignupResponseImpl.fromJson;

  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$$SignupResponseImplCopyWith<_$SignupResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserDto _$UserDtoFromJson(Map<String, dynamic> json) {
  return _UserDto.fromJson(json);
}

/// @nodoc
mixin _$UserDto {
  String get userId => throw _privateConstructorUsedError;
  PhoneNumberDto get phoneNumber => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDtoCopyWith<UserDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDtoCopyWith<$Res> {
  factory $UserDtoCopyWith(UserDto value, $Res Function(UserDto) then) =
      _$UserDtoCopyWithImpl<$Res, UserDto>;
  @useResult
  $Res call({String userId, PhoneNumberDto phoneNumber, String name});

  $PhoneNumberDtoCopyWith<$Res> get phoneNumber;
}

/// @nodoc
class _$UserDtoCopyWithImpl<$Res, $Val extends UserDto>
    implements $UserDtoCopyWith<$Res> {
  _$UserDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? phoneNumber = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumberDto,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PhoneNumberDtoCopyWith<$Res> get phoneNumber {
    return $PhoneNumberDtoCopyWith<$Res>(_value.phoneNumber, (value) {
      return _then(_value.copyWith(phoneNumber: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserDtoImplCopyWith<$Res> implements $UserDtoCopyWith<$Res> {
  factory _$$UserDtoImplCopyWith(
          _$UserDtoImpl value, $Res Function(_$UserDtoImpl) then) =
      __$$UserDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, PhoneNumberDto phoneNumber, String name});

  @override
  $PhoneNumberDtoCopyWith<$Res> get phoneNumber;
}

/// @nodoc
class __$$UserDtoImplCopyWithImpl<$Res>
    extends _$UserDtoCopyWithImpl<$Res, _$UserDtoImpl>
    implements _$$UserDtoImplCopyWith<$Res> {
  __$$UserDtoImplCopyWithImpl(
      _$UserDtoImpl _value, $Res Function(_$UserDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? phoneNumber = null,
    Object? name = null,
  }) {
    return _then(_$UserDtoImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumberDto,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDtoImpl extends _UserDto {
  const _$UserDtoImpl(
      {required this.userId, required this.phoneNumber, required this.name})
      : super._();

  factory _$UserDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDtoImplFromJson(json);

  @override
  final String userId;
  @override
  final PhoneNumberDto phoneNumber;
  @override
  final String name;

  @override
  String toString() {
    return 'UserDto(userId: $userId, phoneNumber: $phoneNumber, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDtoImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, phoneNumber, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDtoImplCopyWith<_$UserDtoImpl> get copyWith =>
      __$$UserDtoImplCopyWithImpl<_$UserDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDtoImplToJson(
      this,
    );
  }
}

abstract class _UserDto extends UserDto {
  const factory _UserDto(
      {required final String userId,
      required final PhoneNumberDto phoneNumber,
      required final String name}) = _$UserDtoImpl;
  const _UserDto._() : super._();

  factory _UserDto.fromJson(Map<String, dynamic> json) = _$UserDtoImpl.fromJson;

  @override
  String get userId;
  @override
  PhoneNumberDto get phoneNumber;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$UserDtoImplCopyWith<_$UserDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PhoneNumberDto _$PhoneNumberDtoFromJson(Map<String, dynamic> json) {
  return _PhoneNumberDto.fromJson(json);
}

/// @nodoc
mixin _$PhoneNumberDto {
  String get number => throw _privateConstructorUsedError;
  String? get normalizedNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhoneNumberDtoCopyWith<PhoneNumberDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneNumberDtoCopyWith<$Res> {
  factory $PhoneNumberDtoCopyWith(
          PhoneNumberDto value, $Res Function(PhoneNumberDto) then) =
      _$PhoneNumberDtoCopyWithImpl<$Res, PhoneNumberDto>;
  @useResult
  $Res call({String number, String? normalizedNumber});
}

/// @nodoc
class _$PhoneNumberDtoCopyWithImpl<$Res, $Val extends PhoneNumberDto>
    implements $PhoneNumberDtoCopyWith<$Res> {
  _$PhoneNumberDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? normalizedNumber = freezed,
  }) {
    return _then(_value.copyWith(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      normalizedNumber: freezed == normalizedNumber
          ? _value.normalizedNumber
          : normalizedNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhoneNumberDtoImplCopyWith<$Res>
    implements $PhoneNumberDtoCopyWith<$Res> {
  factory _$$PhoneNumberDtoImplCopyWith(_$PhoneNumberDtoImpl value,
          $Res Function(_$PhoneNumberDtoImpl) then) =
      __$$PhoneNumberDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String number, String? normalizedNumber});
}

/// @nodoc
class __$$PhoneNumberDtoImplCopyWithImpl<$Res>
    extends _$PhoneNumberDtoCopyWithImpl<$Res, _$PhoneNumberDtoImpl>
    implements _$$PhoneNumberDtoImplCopyWith<$Res> {
  __$$PhoneNumberDtoImplCopyWithImpl(
      _$PhoneNumberDtoImpl _value, $Res Function(_$PhoneNumberDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? normalizedNumber = freezed,
  }) {
    return _then(_$PhoneNumberDtoImpl(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      normalizedNumber: freezed == normalizedNumber
          ? _value.normalizedNumber
          : normalizedNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhoneNumberDtoImpl implements _PhoneNumberDto {
  const _$PhoneNumberDtoImpl({required this.number, this.normalizedNumber});

  factory _$PhoneNumberDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhoneNumberDtoImplFromJson(json);

  @override
  final String number;
  @override
  final String? normalizedNumber;

  @override
  String toString() {
    return 'PhoneNumberDto(number: $number, normalizedNumber: $normalizedNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneNumberDtoImpl &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.normalizedNumber, normalizedNumber) ||
                other.normalizedNumber == normalizedNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, number, normalizedNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneNumberDtoImplCopyWith<_$PhoneNumberDtoImpl> get copyWith =>
      __$$PhoneNumberDtoImplCopyWithImpl<_$PhoneNumberDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhoneNumberDtoImplToJson(
      this,
    );
  }
}

abstract class _PhoneNumberDto implements PhoneNumberDto {
  const factory _PhoneNumberDto(
      {required final String number,
      final String? normalizedNumber}) = _$PhoneNumberDtoImpl;

  factory _PhoneNumberDto.fromJson(Map<String, dynamic> json) =
      _$PhoneNumberDtoImpl.fromJson;

  @override
  String get number;
  @override
  String? get normalizedNumber;
  @override
  @JsonKey(ignore: true)
  _$$PhoneNumberDtoImplCopyWith<_$PhoneNumberDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChangePasswordRequest _$ChangePasswordRequestFromJson(
    Map<String, dynamic> json) {
  return _ChangePasswordRequest.fromJson(json);
}

/// @nodoc
mixin _$ChangePasswordRequest {
  String get phoneNumber => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get oldPassword => throw _privateConstructorUsedError;
  String get newPassword => throw _privateConstructorUsedError;
  String get newPasswordConfirmation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChangePasswordRequestCopyWith<ChangePasswordRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChangePasswordRequestCopyWith<$Res> {
  factory $ChangePasswordRequestCopyWith(ChangePasswordRequest value,
          $Res Function(ChangePasswordRequest) then) =
      _$ChangePasswordRequestCopyWithImpl<$Res, ChangePasswordRequest>;
  @useResult
  $Res call(
      {String phoneNumber,
      String username,
      String oldPassword,
      String newPassword,
      String newPasswordConfirmation});
}

/// @nodoc
class _$ChangePasswordRequestCopyWithImpl<$Res,
        $Val extends ChangePasswordRequest>
    implements $ChangePasswordRequestCopyWith<$Res> {
  _$ChangePasswordRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? username = null,
    Object? oldPassword = null,
    Object? newPassword = null,
    Object? newPasswordConfirmation = null,
  }) {
    return _then(_value.copyWith(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      oldPassword: null == oldPassword
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPasswordConfirmation: null == newPasswordConfirmation
          ? _value.newPasswordConfirmation
          : newPasswordConfirmation // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChangePasswordRequestImplCopyWith<$Res>
    implements $ChangePasswordRequestCopyWith<$Res> {
  factory _$$ChangePasswordRequestImplCopyWith(
          _$ChangePasswordRequestImpl value,
          $Res Function(_$ChangePasswordRequestImpl) then) =
      __$$ChangePasswordRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String phoneNumber,
      String username,
      String oldPassword,
      String newPassword,
      String newPasswordConfirmation});
}

/// @nodoc
class __$$ChangePasswordRequestImplCopyWithImpl<$Res>
    extends _$ChangePasswordRequestCopyWithImpl<$Res,
        _$ChangePasswordRequestImpl>
    implements _$$ChangePasswordRequestImplCopyWith<$Res> {
  __$$ChangePasswordRequestImplCopyWithImpl(_$ChangePasswordRequestImpl _value,
      $Res Function(_$ChangePasswordRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
    Object? username = null,
    Object? oldPassword = null,
    Object? newPassword = null,
    Object? newPasswordConfirmation = null,
  }) {
    return _then(_$ChangePasswordRequestImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      oldPassword: null == oldPassword
          ? _value.oldPassword
          : oldPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPasswordConfirmation: null == newPasswordConfirmation
          ? _value.newPasswordConfirmation
          : newPasswordConfirmation // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChangePasswordRequestImpl implements _ChangePasswordRequest {
  const _$ChangePasswordRequestImpl(
      {required this.phoneNumber,
      required this.username,
      required this.oldPassword,
      required this.newPassword,
      required this.newPasswordConfirmation});

  factory _$ChangePasswordRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChangePasswordRequestImplFromJson(json);

  @override
  final String phoneNumber;
  @override
  final String username;
  @override
  final String oldPassword;
  @override
  final String newPassword;
  @override
  final String newPasswordConfirmation;

  @override
  String toString() {
    return 'ChangePasswordRequest(phoneNumber: $phoneNumber, username: $username, oldPassword: $oldPassword, newPassword: $newPassword, newPasswordConfirmation: $newPasswordConfirmation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangePasswordRequestImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.oldPassword, oldPassword) ||
                other.oldPassword == oldPassword) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(
                    other.newPasswordConfirmation, newPasswordConfirmation) ||
                other.newPasswordConfirmation == newPasswordConfirmation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber, username,
      oldPassword, newPassword, newPasswordConfirmation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangePasswordRequestImplCopyWith<_$ChangePasswordRequestImpl>
      get copyWith => __$$ChangePasswordRequestImplCopyWithImpl<
          _$ChangePasswordRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChangePasswordRequestImplToJson(
      this,
    );
  }
}

abstract class _ChangePasswordRequest implements ChangePasswordRequest {
  const factory _ChangePasswordRequest(
          {required final String phoneNumber,
          required final String username,
          required final String oldPassword,
          required final String newPassword,
          required final String newPasswordConfirmation}) =
      _$ChangePasswordRequestImpl;

  factory _ChangePasswordRequest.fromJson(Map<String, dynamic> json) =
      _$ChangePasswordRequestImpl.fromJson;

  @override
  String get phoneNumber;
  @override
  String get username;
  @override
  String get oldPassword;
  @override
  String get newPassword;
  @override
  String get newPasswordConfirmation;
  @override
  @JsonKey(ignore: true)
  _$$ChangePasswordRequestImplCopyWith<_$ChangePasswordRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
