import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:carai/core/utils/file/multipart_file_builder.dart';
import 'dio_provider.dart';

part 'file_api.g.dart';

@riverpod
FileApi fileApi(FileApiRef ref) {
  return FileApi(ref.watch(dioProvider));
}

class FileApi {
  final Dio _dio;

  FileApi(this._dio);

  Future<String> uploadProfileImage(XFile file) async {
    final multipartFile = await buildMultipartFile(file);
    final formData = FormData.fromMap({'file': multipartFile});

    final response = await _dio.post('/api/files/profile', data: formData);

    final result = response.data['result'] as Map<String, dynamic>;
    return result['url'] as String;
  }
}
