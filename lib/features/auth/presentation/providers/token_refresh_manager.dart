import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/auth_repository_impl.dart';

part 'token_refresh_manager.g.dart';

/// This provider is kept alive so it can listen to app lifecycle changes
@Riverpod(keepAlive: true)
class TokenRefreshManager extends _$TokenRefreshManager
    with WidgetsBindingObserver {
  @override
  void build() {
    // Add observer when initialized
    WidgetsBinding.instance.addObserver(this);

    // Cleanup when disposed
    ref.onDispose(() {
      WidgetsBinding.instance.removeObserver(this);
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _refreshToken();
    }
  }

  Future<void> _refreshToken() async {
    // We don't want to trigger this if user is not logged in
    final authStatus = await ref.read(authRepositoryProvider).checkAuthStatus();
    final isLoggedIn = authStatus.fold((_) => false, (user) => user != null);

    if (isLoggedIn) {
      debugPrint('🔄 [TokenRefreshManager] App resumed, refreshing token...');
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
