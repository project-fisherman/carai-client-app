// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_vehicle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ServiceVehicle {
  int get id => throw _privateConstructorUsedError;
  String get year => throw _privateConstructorUsedError;
  String get make => throw _privateConstructorUsedError;
  String get model => throw _privateConstructorUsedError;
  String get ownerName => throw _privateConstructorUsedError;
  String get licensePlate => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ServiceVehicleCopyWith<ServiceVehicle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceVehicleCopyWith<$Res> {
  factory $ServiceVehicleCopyWith(
          ServiceVehicle value, $Res Function(ServiceVehicle) then) =
      _$ServiceVehicleCopyWithImpl<$Res, ServiceVehicle>;
  @useResult
  $Res call(
      {int id,
      String year,
      String make,
      String model,
      String ownerName,
      String licensePlate,
      String status});
}

/// @nodoc
class _$ServiceVehicleCopyWithImpl<$Res, $Val extends ServiceVehicle>
    implements $ServiceVehicleCopyWith<$Res> {
  _$ServiceVehicleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? year = null,
    Object? make = null,
    Object? model = null,
    Object? ownerName = null,
    Object? licensePlate = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      make: null == make
          ? _value.make
          : make // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      ownerName: null == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String,
      licensePlate: null == licensePlate
          ? _value.licensePlate
          : licensePlate // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceVehicleImplCopyWith<$Res>
    implements $ServiceVehicleCopyWith<$Res> {
  factory _$$ServiceVehicleImplCopyWith(_$ServiceVehicleImpl value,
          $Res Function(_$ServiceVehicleImpl) then) =
      __$$ServiceVehicleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String year,
      String make,
      String model,
      String ownerName,
      String licensePlate,
      String status});
}

/// @nodoc
class __$$ServiceVehicleImplCopyWithImpl<$Res>
    extends _$ServiceVehicleCopyWithImpl<$Res, _$ServiceVehicleImpl>
    implements _$$ServiceVehicleImplCopyWith<$Res> {
  __$$ServiceVehicleImplCopyWithImpl(
      _$ServiceVehicleImpl _value, $Res Function(_$ServiceVehicleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? year = null,
    Object? make = null,
    Object? model = null,
    Object? ownerName = null,
    Object? licensePlate = null,
    Object? status = null,
  }) {
    return _then(_$ServiceVehicleImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      make: null == make
          ? _value.make
          : make // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      ownerName: null == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String,
      licensePlate: null == licensePlate
          ? _value.licensePlate
          : licensePlate // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ServiceVehicleImpl implements _ServiceVehicle {
  const _$ServiceVehicleImpl(
      {required this.id,
      required this.year,
      required this.make,
      required this.model,
      required this.ownerName,
      required this.licensePlate,
      required this.status});

  @override
  final int id;
  @override
  final String year;
  @override
  final String make;
  @override
  final String model;
  @override
  final String ownerName;
  @override
  final String licensePlate;
  @override
  final String status;

  @override
  String toString() {
    return 'ServiceVehicle(id: $id, year: $year, make: $make, model: $model, ownerName: $ownerName, licensePlate: $licensePlate, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceVehicleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.make, make) || other.make == make) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.ownerName, ownerName) ||
                other.ownerName == ownerName) &&
            (identical(other.licensePlate, licensePlate) ||
                other.licensePlate == licensePlate) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, year, make, model, ownerName, licensePlate, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceVehicleImplCopyWith<_$ServiceVehicleImpl> get copyWith =>
      __$$ServiceVehicleImplCopyWithImpl<_$ServiceVehicleImpl>(
          this, _$identity);
}

abstract class _ServiceVehicle implements ServiceVehicle {
  const factory _ServiceVehicle(
      {required final int id,
      required final String year,
      required final String make,
      required final String model,
      required final String ownerName,
      required final String licensePlate,
      required final String status}) = _$ServiceVehicleImpl;

  @override
  int get id;
  @override
  String get year;
  @override
  String get make;
  @override
  String get model;
  @override
  String get ownerName;
  @override
  String get licensePlate;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$ServiceVehicleImplCopyWith<_$ServiceVehicleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
