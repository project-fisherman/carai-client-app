// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_refresh_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tokenRefreshManagerHash() =>
    r'2c2d453df96f3ce3d106535efa0cb6eaadd1fe40';

/// This provider is kept alive and refreshes token only on app cold start
/// (equivalent to Android's onStart)
///
/// Copied from [TokenRefreshManager].
@ProviderFor(TokenRefreshManager)
final tokenRefreshManagerProvider =
    NotifierProvider<TokenRefreshManager, void>.internal(
  TokenRefreshManager.new,
  name: r'tokenRefreshManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tokenRefreshManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TokenRefreshManager = Notifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
