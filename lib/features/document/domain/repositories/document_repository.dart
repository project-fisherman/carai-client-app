import 'package:image_picker/image_picker.dart';
import 'package:fpdart/fpdart.dart';
import 'package:carai/core/error/failure.dart';

abstract class DocumentRepository {
  Future<Either<Failure, String>> uploadDocument(XFile file);
}
