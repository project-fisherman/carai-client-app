// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SendSmsCodeRequestImpl _$$SendSmsCodeRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$SendSmsCodeRequestImpl(
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$$SendSmsCodeRequestImplToJson(
        _$SendSmsCodeRequestImpl instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
    };

_$SendSmsCodeResponseImpl _$$SendSmsCodeResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SendSmsCodeResponseImpl(
      expireSeconds: (json['expireSeconds'] as num).toInt(),
    );

Map<String, dynamic> _$$SendSmsCodeResponseImplToJson(
        _$SendSmsCodeResponseImpl instance) =>
    <String, dynamic>{
      'expireSeconds': instance.expireSeconds,
    };

_$VerifySmsCodeRequestImpl _$$VerifySmsCodeRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifySmsCodeRequestImpl(
      phoneNumber: json['phoneNumber'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$$VerifySmsCodeRequestImplToJson(
        _$VerifySmsCodeRequestImpl instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'code': instance.code,
    };

_$VerifySmsCodeResponseImpl _$$VerifySmsCodeResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$VerifySmsCodeResponseImpl(
      verified: json['verified'] as bool,
      phoneNumberVerificationToken:
          json['phoneNumberVerificationToken'] as String?,
    );

Map<String, dynamic> _$$VerifySmsCodeResponseImplToJson(
        _$VerifySmsCodeResponseImpl instance) =>
    <String, dynamic>{
      'verified': instance.verified,
      'phoneNumberVerificationToken': instance.phoneNumberVerificationToken,
    };

_$LoginRequestImpl _$$LoginRequestImplFromJson(Map<String, dynamic> json) =>
    _$LoginRequestImpl(
      phoneNumber: json['phoneNumber'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$$LoginRequestImplToJson(_$LoginRequestImpl instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'username': instance.username,
      'password': instance.password,
    };

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      user: UserDto.fromJson(json['user'] as Map<String, dynamic>),
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };

_$RefreshTokenRequestImpl _$$RefreshTokenRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$RefreshTokenRequestImpl(
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$$RefreshTokenRequestImplToJson(
        _$RefreshTokenRequestImpl instance) =>
    <String, dynamic>{
      'refreshToken': instance.refreshToken,
    };

_$RefreshTokenResponseImpl _$$RefreshTokenResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RefreshTokenResponseImpl(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$$RefreshTokenResponseImplToJson(
        _$RefreshTokenResponseImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };

_$SignupRequestImpl _$$SignupRequestImplFromJson(Map<String, dynamic> json) =>
    _$SignupRequestImpl(
      phoneNumber: json['phoneNumber'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      passwordConfirmation: json['passwordConfirmation'] as String,
      phoneNumberVerificationToken:
          json['phoneNumberVerificationToken'] as String,
    );

Map<String, dynamic> _$$SignupRequestImplToJson(_$SignupRequestImpl instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'username': instance.username,
      'password': instance.password,
      'passwordConfirmation': instance.passwordConfirmation,
      'phoneNumberVerificationToken': instance.phoneNumberVerificationToken,
    };

_$SignupResponseImpl _$$SignupResponseImplFromJson(Map<String, dynamic> json) =>
    _$SignupResponseImpl(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$$SignupResponseImplToJson(
        _$SignupResponseImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };

_$UserDtoImpl _$$UserDtoImplFromJson(Map<String, dynamic> json) =>
    _$UserDtoImpl(
      userId: json['userId'] as String,
      phoneNumber:
          PhoneNumberDto.fromJson(json['phoneNumber'] as Map<String, dynamic>),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$UserDtoImplToJson(_$UserDtoImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'phoneNumber': instance.phoneNumber,
      'name': instance.name,
    };

_$PhoneNumberDtoImpl _$$PhoneNumberDtoImplFromJson(Map<String, dynamic> json) =>
    _$PhoneNumberDtoImpl(
      number: json['number'] as String,
      normalizedNumber: json['normalizedNumber'] as String?,
    );

Map<String, dynamic> _$$PhoneNumberDtoImplToJson(
        _$PhoneNumberDtoImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'normalizedNumber': instance.normalizedNumber,
    };

_$ChangePasswordRequestImpl _$$ChangePasswordRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ChangePasswordRequestImpl(
      phoneNumber: json['phoneNumber'] as String,
      username: json['username'] as String,
      oldPassword: json['oldPassword'] as String,
      newPassword: json['newPassword'] as String,
      newPasswordConfirmation: json['newPasswordConfirmation'] as String,
    );

Map<String, dynamic> _$$ChangePasswordRequestImplToJson(
        _$ChangePasswordRequestImpl instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'username': instance.username,
      'oldPassword': instance.oldPassword,
      'newPassword': instance.newPassword,
      'newPasswordConfirmation': instance.newPasswordConfirmation,
    };
