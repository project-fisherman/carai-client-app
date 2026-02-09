// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_workshop_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$manageWorkshopRepositoryHash() =>
    r'05594b7c009ebc75593df9662f4bfb911800d20c';

/// See also [manageWorkshopRepository].
@ProviderFor(manageWorkshopRepository)
final manageWorkshopRepositoryProvider =
    AutoDisposeProvider<ManageWorkshopRepository>.internal(
  manageWorkshopRepository,
  name: r'manageWorkshopRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$manageWorkshopRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ManageWorkshopRepositoryRef
    = AutoDisposeProviderRef<ManageWorkshopRepository>;
String _$manageWorkshopViewModelHash() =>
    r'db69af1aec67473451e2f9fec0c7c00f2f2a617b';

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

abstract class _$ManageWorkshopViewModel
    extends BuildlessAutoDisposeAsyncNotifier<List<RepairShopUser>> {
  late final int shopId;

  FutureOr<List<RepairShopUser>> build(
    int shopId,
  );
}

/// See also [ManageWorkshopViewModel].
@ProviderFor(ManageWorkshopViewModel)
const manageWorkshopViewModelProvider = ManageWorkshopViewModelFamily();

/// See also [ManageWorkshopViewModel].
class ManageWorkshopViewModelFamily
    extends Family<AsyncValue<List<RepairShopUser>>> {
  /// See also [ManageWorkshopViewModel].
  const ManageWorkshopViewModelFamily();

  /// See also [ManageWorkshopViewModel].
  ManageWorkshopViewModelProvider call(
    int shopId,
  ) {
    return ManageWorkshopViewModelProvider(
      shopId,
    );
  }

  @override
  ManageWorkshopViewModelProvider getProviderOverride(
    covariant ManageWorkshopViewModelProvider provider,
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
  String? get name => r'manageWorkshopViewModelProvider';
}

/// See also [ManageWorkshopViewModel].
class ManageWorkshopViewModelProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ManageWorkshopViewModel,
        List<RepairShopUser>> {
  /// See also [ManageWorkshopViewModel].
  ManageWorkshopViewModelProvider(
    int shopId,
  ) : this._internal(
          () => ManageWorkshopViewModel()..shopId = shopId,
          from: manageWorkshopViewModelProvider,
          name: r'manageWorkshopViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$manageWorkshopViewModelHash,
          dependencies: ManageWorkshopViewModelFamily._dependencies,
          allTransitiveDependencies:
              ManageWorkshopViewModelFamily._allTransitiveDependencies,
          shopId: shopId,
        );

  ManageWorkshopViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.shopId,
  }) : super.internal();

  final int shopId;

  @override
  FutureOr<List<RepairShopUser>> runNotifierBuild(
    covariant ManageWorkshopViewModel notifier,
  ) {
    return notifier.build(
      shopId,
    );
  }

  @override
  Override overrideWith(ManageWorkshopViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: ManageWorkshopViewModelProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ManageWorkshopViewModel,
      List<RepairShopUser>> createElement() {
    return _ManageWorkshopViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ManageWorkshopViewModelProvider && other.shopId == shopId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, shopId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ManageWorkshopViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<List<RepairShopUser>> {
  /// The parameter `shopId` of this provider.
  int get shopId;
}

class _ManageWorkshopViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ManageWorkshopViewModel,
        List<RepairShopUser>> with ManageWorkshopViewModelRef {
  _ManageWorkshopViewModelProviderElement(super.provider);

  @override
  int get shopId => (origin as ManageWorkshopViewModelProvider).shopId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
