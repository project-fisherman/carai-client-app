import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_vehicle.freezed.dart';

@freezed
class ServiceVehicle with _$ServiceVehicle {
  const factory ServiceVehicle({
    required int id,
    required String year,
    required String make,
    required String model,
    required String ownerName,
    required String licensePlate,
    required String status, // e.g., 'Pending', 'In Progress'
  }) = _ServiceVehicle;
}
