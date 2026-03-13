import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_provider.dart';
import '../dtos/mechanic_dashboard_dtos.dart';

part 'repair_shop_api.g.dart';

@riverpod
RepairShopApi repairShopApi(RepairShopApiRef ref) {
  return RepairShopApi(ref.watch(dioProvider));
}

class RepairShopApi {
  final Dio _dio;

  RepairShopApi(this._dio);

  Future<RepairShopResponseDto> createShop({
    required CreateShopRequestDto request,
  }) async {
    final response = await _dio.post('/repair-shops', data: request.toJson());
    return RepairShopResponseDto.fromJson(response.data['result']);
  }

  Future<List<RepairShopResponseDto>> getMyShops() async {
    final response = await _dio.get('/repair-shops/my');
    final list = (response.data['result'] as List?) ?? [];
    return list.map((e) => RepairShopResponseDto.fromJson(e)).toList();
  }

  Future<void> leaveShop({required String shopId}) async {
    await _dio.post('/repair-shops/$shopId/leave');
  }

  Future<RepairShopUserResponseDto> getMyProfile({
    required String shopId,
  }) async {
    final response = await _dio.get('/repair-shops/$shopId/me');
    return RepairShopUserResponseDto.fromJson(response.data['result']);
  }

  Future<InviteByPhoneResponseDto> inviteByPhone({
    required String shopId,
    required InviteByPhoneRequestDto request,
  }) async {
    final response =
        await _dio.post('/repair-shops/$shopId/invites/phone', data: request.toJson());
    return InviteByPhoneResponseDto.fromJson(response.data['result']);
  }

  Future<void> acceptInviteByToken({
    required AcceptPhoneInviteRequestDto request,
  }) async {
    await _dio.post('/repair-shops/invites/accept', data: request.toJson());
  }

  Future<bool> isInvitePendingByToken({
    required String token,
  }) async {
    final response = await _dio.get(
      '/repair-shops/invites/pending',
      queryParameters: {'token': token},
    );
    return response.data['result']['pending'] as bool;
  }
}
