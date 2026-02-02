import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user.dart';

part 'auth_dtos.freezed.dart';
part 'auth_dtos.g.dart';

@freezed
class SendSmsCodeRequest with _$SendSmsCodeRequest {
  const factory SendSmsCodeRequest({required String phoneNumber}) =
      _SendSmsCodeRequest;

  factory SendSmsCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$SendSmsCodeRequestFromJson(json);
}

@freezed
class SendSmsCodeResponse with _$SendSmsCodeResponse {
  const factory SendSmsCodeResponse({required int expireSeconds}) =
      _SendSmsCodeResponse;

  factory SendSmsCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$SendSmsCodeResponseFromJson(json);
}

@freezed
class VerifySmsCodeRequest with _$VerifySmsCodeRequest {
  const factory VerifySmsCodeRequest({
    required String phoneNumber,
    required String code,
  }) = _VerifySmsCodeRequest;

  factory VerifySmsCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifySmsCodeRequestFromJson(json);
}

@freezed
class VerifySmsCodeResponse with _$VerifySmsCodeResponse {
  const factory VerifySmsCodeResponse({
    required bool verified,
    String? phoneNumberVerificationToken,
  }) = _VerifySmsCodeResponse;

  factory VerifySmsCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifySmsCodeResponseFromJson(json);
}

@freezed
class LoginRequest with _$LoginRequest {
  const factory LoginRequest({
    required String phoneNumber,
    required String username,
    required String password,
  }) = _LoginRequest;

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
}

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required UserDto user, // We need UserDto
    required String accessToken,
    required String refreshToken,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
class RefreshTokenRequest with _$RefreshTokenRequest {
  const factory RefreshTokenRequest({required String refreshToken}) =
      _RefreshTokenRequest;

  factory RefreshTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenRequestFromJson(json);
}

@freezed
class RefreshTokenResponse with _$RefreshTokenResponse {
  const factory RefreshTokenResponse({
    required String accessToken,
    required String refreshToken,
  }) = _RefreshTokenResponse;

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseFromJson(json);
}

@freezed
class SignupRequest with _$SignupRequest {
  const factory SignupRequest({
    required String phoneNumber,
    required String username,
    required String password,
    required String passwordConfirmation,
    required String phoneNumberVerificationToken,
  }) = _SignupRequest;

  factory SignupRequest.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestFromJson(json);
}

@freezed
class SignupResponse with _$SignupResponse {
  const factory SignupResponse({
    required String accessToken,
    required String refreshToken,
  }) = _SignupResponse;

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);
}

@freezed
class UserDto with _$UserDto {
  const factory UserDto({
    required String userId,
    required PhoneNumberDto phoneNumber,
    required String name,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  // Mapper
  const UserDto._();
  User toDomain() =>
      User(id: userId, phoneNumber: phoneNumber.number, name: name);
}

@freezed
class PhoneNumberDto with _$PhoneNumberDto {
  const factory PhoneNumberDto({
    required String number,
    String? normalizedNumber,
  }) = _PhoneNumberDto;

  factory PhoneNumberDto.fromJson(Map<String, dynamic> json) =>
      _$PhoneNumberDtoFromJson(json);
}
