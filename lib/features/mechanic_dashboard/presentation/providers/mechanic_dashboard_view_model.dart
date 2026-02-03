import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/service_vehicle.dart';
import '../../data/repositories/mock_mechanic_dashboard_repository.dart';

part 'mechanic_dashboard_view_model.g.dart';

@riverpod
class MechanicDashboardViewModel extends _$MechanicDashboardViewModel {
  @override
  FutureOr<List<ServiceVehicle>> build(int shopId) {
    return ref
        .watch(mockMechanicDashboardRepositoryProvider)
        .getServiceQueue(shopId);
  }
}
