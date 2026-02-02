// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_refresh_manager.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tokenRefreshManagerHash() =>
    r'c5ad2a43f3e6c2431435bf7827cea38d3cab8dd0';

/// This provider is kept alive and refreshes token only on app cold start
/// Returns true if token refresh succeeded or user is not logged in (no refresh needed)
/// Returns false if token refresh failed
///
/// Copied from [TokenRefreshManager].
@ProviderFor(TokenRefreshManager)
final tokenRefreshManagerProvider =
    AsyncNotifierProvider<TokenRefreshManager, bool>.internal(
  TokenRefreshManager.new,
  name: r'tokenRefreshManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tokenRefreshManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TokenRefreshManager = AsyncNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
