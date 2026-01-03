import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:carai/core/error/failure.dart';
import 'package:carai/core/network/dio_provider.dart';
import 'package:carai/features/document/domain/repositories/document_repository.dart';

part 'document_repository_impl.g.dart';

@riverpod
DocumentRepository documentRepository(DocumentRepositoryRef ref) {
  return DocumentRepositoryImpl(ref.read(dioProvider));
}

class DocumentRepositoryImpl implements DocumentRepository {
  final Dio _dio;

  DocumentRepositoryImpl(this._dio);

  @override
  Future<Either<Failure, String>> uploadDocument(File file) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(file.path),
      });

      final response = await _dio.post('/upload', data: formData);

      if (response.statusCode == 200) {
        // Assuming the response data contains the success message or ID
        return Right(response.data['id'] as String);
      } else {
        return Left(ServerFailure('Upload failed with status code: ${response.statusCode}'));
      }
    } on DioException catch (e) {
      return Left(NetworkFailure(e.message ?? 'Network Error'));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
