import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dtos.freezed.dart';
part 'user_dtos.g.dart';

@freezed
class UpdateMeRequest with _$UpdateMeRequest {
  const factory UpdateMeRequest({required String name}) = _UpdateMeRequest;

  factory UpdateMeRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateMeRequestFromJson(json);
}

@freezed
class MeResponse with _$MeResponse {
  const factory MeResponse({
    required String userId,
    required String name,
    required String phoneNumber,
  }) = _MeResponse;

  factory MeResponse.fromJson(Map<String, dynamic> json) =>
      _$MeResponseFromJson(json);
}
