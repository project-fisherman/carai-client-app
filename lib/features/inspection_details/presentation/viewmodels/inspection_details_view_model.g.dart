// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inspection_details_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$inspectionDetailsViewModelHash() =>
    r'82924b1c5b460d991f0f419e28c158f6c8f62143';

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

abstract class _$InspectionDetailsViewModel
    extends BuildlessAutoDisposeAsyncNotifier<InspectionDetailsState> {
  late final String jobId;

  FutureOr<InspectionDetailsState> build(
    String jobId,
  );
}

/// See also [InspectionDetailsViewModel].
@ProviderFor(InspectionDetailsViewModel)
const inspectionDetailsViewModelProvider = InspectionDetailsViewModelFamily();

/// See also [InspectionDetailsViewModel].
class InspectionDetailsViewModelFamily
    extends Family<AsyncValue<InspectionDetailsState>> {
  /// See also [InspectionDetailsViewModel].
  const InspectionDetailsViewModelFamily();

  /// See also [InspectionDetailsViewModel].
  InspectionDetailsViewModelProvider call(
    String jobId,
  ) {
    return InspectionDetailsViewModelProvider(
      jobId,
    );
  }

  @override
  InspectionDetailsViewModelProvider getProviderOverride(
    covariant InspectionDetailsViewModelProvider provider,
  ) {
    return call(
      provider.jobId,
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
  String? get name => r'inspectionDetailsViewModelProvider';
}

/// See also [InspectionDetailsViewModel].
class InspectionDetailsViewModelProvider
    extends AutoDisposeAsyncNotifierProviderImpl<InspectionDetailsViewModel,
        InspectionDetailsState> {
  /// See also [InspectionDetailsViewModel].
  InspectionDetailsViewModelProvider(
    String jobId,
  ) : this._internal(
          () => InspectionDetailsViewModel()..jobId = jobId,
          from: inspectionDetailsViewModelProvider,
          name: r'inspectionDetailsViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$inspectionDetailsViewModelHash,
          dependencies: InspectionDetailsViewModelFamily._dependencies,
          allTransitiveDependencies:
              InspectionDetailsViewModelFamily._allTransitiveDependencies,
          jobId: jobId,
        );

  InspectionDetailsViewModelProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.jobId,
  }) : super.internal();

  final String jobId;

  @override
  FutureOr<InspectionDetailsState> runNotifierBuild(
    covariant InspectionDetailsViewModel notifier,
  ) {
    return notifier.build(
      jobId,
    );
  }

  @override
  Override overrideWith(InspectionDetailsViewModel Function() create) {
    return ProviderOverride(
      origin: this,
      override: InspectionDetailsViewModelProvider._internal(
        () => create()..jobId = jobId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        jobId: jobId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<InspectionDetailsViewModel,
      InspectionDetailsState> createElement() {
    return _InspectionDetailsViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is InspectionDetailsViewModelProvider && other.jobId == jobId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, jobId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin InspectionDetailsViewModelRef
    on AutoDisposeAsyncNotifierProviderRef<InspectionDetailsState> {
  /// The parameter `jobId` of this provider.
  String get jobId;
}

class _InspectionDetailsViewModelProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<InspectionDetailsViewModel,
        InspectionDetailsState> with InspectionDetailsViewModelRef {
  _InspectionDetailsViewModelProviderElement(super.provider);

  @override
  String get jobId => (origin as InspectionDetailsViewModelProvider).jobId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
