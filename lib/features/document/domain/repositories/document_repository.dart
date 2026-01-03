import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:carai/core/error/failure.dart';

abstract class DocumentRepository {
  Future<Either<Failure, String>> uploadDocument(File file);
}
