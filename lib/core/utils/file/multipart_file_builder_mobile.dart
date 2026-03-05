import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

Future<MultipartFile> buildMultipartFile(XFile file) async {
  return await MultipartFile.fromFile(file.path, filename: file.name);
}
