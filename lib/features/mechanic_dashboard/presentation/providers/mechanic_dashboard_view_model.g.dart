// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mechanic_dashboard_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mechanicDashboardViewModelHash() =>
    r'096d6a2edcef2497be8f40afbb4f35a65f44e928';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$MechanicDashboardViewModel
    extends BuildlessAutoDisposeAsyncNotifier<List<RepairJob>> {
  late final String shopId;

  FutureOr<List<RepairJob>> build(
    String shopId,
  );
}

/// See also [MechanicDashboardViewModel].
@ProviderFor(MechanicDashboardViewModel)
const mechanicDashboardViewModelProvider = MechanicDashboardViewModelFamily();

/// See also [MechanicDashboardViewModel].
class MechanicDashboardViewModelFamily
    extends Family<AsyncValue<List<RepairJob>>> {
  /// See also [MechanicDashboardViewModel].
  const MechanicDashboardViewModelFamily();

  /// See also [MechanicDashboardViewModel].
  MechanicDashboardViewModelProvider call(
    String shopId,
  ) {
    return MechanicDashboardViewModelProvider(
      shopId,
    );
  }

  @override
  MechanicDashboardViewModelProvider getProviderOverride(
    covariant MechanicDashboardViewModelProvider provider,
  ) {
    return call(
      provider.shopId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'mechanicDashboardViewModelProvider';
}

/// See also [MechanicDashboardViewModel].
class MechanicDashboardViewModelProvider
    extends AutoDisposeAsyncNotifierProviderImpl<MechanicDashboardViewModel,
        List<RepairJob>> {
  /// See also [MechanicDashboardViewModel].
  MechanicDashboardViewModelProvider(
    String shopId,
  ) : this._internal(
          () => MechanicDashboardViewModel()..shopId = shopId,
          from: mechanicDashboardViewModelProvider,
          name: r'mechanicDashboardViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mechanicDashboardViewModelHash,
          dependencies: MechanicDashboardViewModelFamily._dependencies,
          allTransitiveDependencies:
              MechanicDashboardViewModelFamily._allTransitiveDependencies,
          shopId: shopId,
        );

  MechanicDashboardViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.shopId,
  }) : super.internal();

  final String shopId;

  @override
  FutureOr<List<RepairJob>> runNotifierBuild(
    covariant MechanicDashboardViewModel notifier,
  ) {
    return notifier.build(
      shopId,
    );
  }

  @override
  Override overrideWith(MechanicDashboardViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: MechanicDashboardViewModelProvider._internal(
        () => create()..shopId = shopId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        shopId: shopId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<MechanicDashboardViewModel,
      List<RepairJob>> createElement() {
    return _MechanicDashboardViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MechanicDashboardViewModelProvider &&
        other.shopId == shopId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, shopId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MechanicDashboardViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<List<RepairJob>> {
  /// The parameter `shopId` of this provider.
  String get shopId;
}

class _MechanicDashboardViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<MechanicDashboardViewModel,
        List<RepairJob>> with MechanicDashboardViewModelRef {
  _MechanicDashboardViewModelProviderElement(super.provider);

  @override
  String get shopId => (origin as MechanicDashboardViewModelProvider).shopId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
