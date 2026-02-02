import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/auth_repository_impl.dart';

part 'token_refresh_manager.g.dart';

/// This provider is kept alive and refreshes token only on app cold start
/// (equivalent to Android's onStart)
@Riverpod(keepAlive: true)
class TokenRefreshManager extends _$TokenRefreshManager {
  @override
  void build() {
    // Refresh token only once on app cold start (when this provider is first built)
    _refreshToken();
  }

  Future<void> _refreshToken() async {
    // We don't want to trigger this if user is not logged in
    final authStatus = await ref.read(authRepositoryProvider).checkAuthStatus();
    final isLoggedIn = authStatus.fold((_) => false, (user) => user != null);

    if (isLoggedIn) {
      debugPrint('🔄 [TokenRefreshManager] App started, refreshing token...');
      final result = await ref.read(authRepositoryProvider).refreshToken();
      result.fold(
        (failure) => debugPrint(
          '❌ [TokenRefreshManager] Refresh failed: ${failure.message}',
        ),
        (token) =>
            debugPrint('✅ [TokenRefreshManager] Token refreshed successfully'),
      );
    }
  }
}
