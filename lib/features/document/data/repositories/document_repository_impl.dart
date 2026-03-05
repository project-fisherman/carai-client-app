import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:carai/core/error/failure.dart';
import 'package:carai/core/network/dio_provider.dart';
import 'package:carai/core/utils/file/multipart_file_builder.dart';
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
  Future<Either<Failure, String>> uploadDocument(XFile file) async {
    try {
      final multipartFile = await buildMultipartFile(file);
      final formData = FormData.fromMap({'file': multipartFile});

      final response = await _dio.post('/upload', data: formData);

      if (response.statusCode == 200) {
        // Assuming the response data contains the success message or ID
        return Right(response.data['id'] as String);
      } else {
        return Left(
          ServerFailure(
            'Upload failed with status code: ${response.statusCode}',
          ),
        );
      }
    } on DioException catch (e) {
      return Left(NetworkFailure(e.message ?? 'Network Error'));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
