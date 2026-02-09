// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_team_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$manageTeamRepositoryHash() =>
    r'e518e36643872c5606a002d770f32cbf134a5958';

/// See also [manageTeamRepository].
@ProviderFor(manageTeamRepository)
final manageTeamRepositoryProvider =
    AutoDisposeProvider<ManageTeamRepository>.internal(
  manageTeamRepository,
  name: r'manageTeamRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$manageTeamRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ManageTeamRepositoryRef = AutoDisposeProviderRef<ManageTeamRepository>;
String _$manageTeamViewModelHash() =>
    r'29d735b4764477dc475b8afa1a78f326d5f751a3';

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

abstract class _$ManageTeamViewModel
    extends BuildlessAutoDisposeAsyncNotifier<List<RepairShopUser>> {
  late final int shopId;

  FutureOr<List<RepairShopUser>> build(
    int shopId,
  );
}

/// See also [ManageTeamViewModel].
@ProviderFor(ManageTeamViewModel)
const manageTeamViewModelProvider = ManageTeamViewModelFamily();

/// See also [ManageTeamViewModel].
class ManageTeamViewModelFamily
    extends Family<AsyncValue<List<RepairShopUser>>> {
  /// See also [ManageTeamViewModel].
  const ManageTeamViewModelFamily();

  /// See also [ManageTeamViewModel].
  ManageTeamViewModelProvider call(
    int shopId,
  ) {
    return ManageTeamViewModelProvider(
      shopId,
    );
  }

  @override
  ManageTeamViewModelProvider getProviderOverride(
    covariant ManageTeamViewModelProvider provider,
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
  String? get name => r'manageTeamViewModelProvider';
}

/// See also [ManageTeamViewModel].
class ManageTeamViewModelProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ManageTeamViewModel, List<RepairShopUser>> {
  /// See also [ManageTeamViewModel].
  ManageTeamViewModelProvider(
    int shopId,
  ) : this._internal(
          () => ManageTeamViewModel()..shopId = shopId,
          from: manageTeamViewModelProvider,
          name: r'manageTeamViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$manageTeamViewModelHash,
          dependencies: ManageTeamViewModelFamily._dependencies,
          allTransitiveDependencies:
              ManageTeamViewModelFamily._allTransitiveDependencies,
          shopId: shopId,
        );

  ManageTeamViewModelProvider._internal(
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
    covariant ManageTeamViewModel notifier,
  ) {
    return notifier.build(
      shopId,
    );
  }

  @override
  Override overrideWith(ManageTeamViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: ManageTeamViewModelProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ManageTeamViewModel,
      List<RepairShopUser>> createElement() {
    return _ManageTeamViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ManageTeamViewModelProvider && other.shopId == shopId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, shopId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ManageTeamViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<List<RepairShopUser>> {
  /// The parameter `shopId` of this provider.
  int get shopId;
}

class _ManageTeamViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ManageTeamViewModel,
        List<RepairShopUser>> with ManageTeamViewModelRef {
  _ManageTeamViewModelProviderElement(super.provider);

  @override
  int get shopId => (origin as ManageTeamViewModelProvider).shopId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
