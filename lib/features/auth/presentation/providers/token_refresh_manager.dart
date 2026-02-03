import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/auth_repository_impl.dart';

part 'token_refresh_manager.g.dart';

/// This provider is kept alive and refreshes token only on app cold start
/// Returns true if token refresh succeeded or user is not logged in (no refresh needed)
/// Returns false if token refresh failed
@Riverpod(keepAlive: true)
class TokenRefreshManager extends _$TokenRefreshManager {
  @override
  Future<bool> build() async {
    // Check if user is logged in
    final authStatus = await ref.read(authRepositoryProvider).checkAuthStatus();
    final isLoggedIn = authStatus.fold((_) => false, (user) => user != null);

    if (!isLoggedIn) {
      debugPrint(
        'ℹ️ [TokenRefreshManager] User not logged in, skipping refresh',
      );
      return false; // No refresh needed
    }

    // User is logged in, refresh token
    debugPrint('🔄 [TokenRefreshManager] App started, refreshing token...');
    final result = await ref.read(authRepositoryProvider).refreshToken();

    return result.fold(
      (failure) {
        debugPrint(
          '❌ [TokenRefreshManager] Refresh failed: ${failure.message}',
        );
        return false;
      },
      (token) {
        debugPrint('✅ [TokenRefreshManager] Token refreshed successfully');
        return true;
      },
    );
  }
}
