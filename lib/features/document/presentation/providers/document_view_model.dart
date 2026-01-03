import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:carai/core/router/router_provider.dart';
import 'package:carai/core/router/routes.dart';
import 'package:carai/core/error/failure.dart';
import 'package:carai/features/document/data/repositories/document_repository_impl.dart';

part 'document_view_model.g.dart';

@riverpod
class DocumentViewModel extends _$DocumentViewModel {
  @override
  FutureOr<void> build() {
    // Initial state is void (idle)
  }

  Future<void> uploadDocument(File file) async {
    state = const AsyncLoading(); // Set loading state

    final repository = ref.read(documentRepositoryProvider);
    final result = await repository.uploadDocument(file);

    result.fold(
      (failure) {
        state = AsyncError(failure.message, StackTrace.current);
        // We could also use a SnackBar here using a global key if we needed to show a toast
        // ref.read(scaffoldMessengerKeyProvider).currentState?.showSnackBar(...)
      },
      (successId) {
        state = const AsyncData(null);
        // Navigate on success using typed routes
        ref.read(routerProvider).go(const SuccessRoute().location); 
      },
    );
  }
}
