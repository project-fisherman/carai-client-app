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
    final list = response.data['result'] as List;
    return list.map((e) => RepairShopResponseDto.fromJson(e)).toList();
  }
}
