import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/service_vehicle.dart';

part 'mock_mechanic_dashboard_repository.g.dart';

class MockMechanicDashboardRepository {
  Future<List<ServiceVehicle>> getServiceQueue(int shopId) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    return [
      const ServiceVehicle(
        id: 1,
        year: '2019',
        make: 'Ford',
        model: 'F-150',
        ownerName: 'John Doe',
        licensePlate: 'TX-4592',
        status: 'Pending',
      ),
      const ServiceVehicle(
        id: 2,
        year: '2021',
        make: 'Toyota',
        model: 'Camry',
        ownerName: 'Sarah Smith',
        licensePlate: 'CA-8821',
        status: 'In Progress',
      ),
      const ServiceVehicle(
        id: 3,
        year: '2018',
        make: 'Honda',
        model: 'Civic',
        ownerName: 'Mike Ross',
        licensePlate: 'NY-1029',
        status: 'Completed',
      ),
      const ServiceVehicle(
        id: 4,
        year: '2023',
        make: 'Tesla',
        model: 'Model 3',
        ownerName: 'Elon M.',
        licensePlate: 'TX-9999',
        status: 'Pending',
      ),
    ];
  }
}

@riverpod
MockMechanicDashboardRepository mockMechanicDashboardRepository(
  MockMechanicDashboardRepositoryRef ref,
) {
  return MockMechanicDashboardRepository();
}
