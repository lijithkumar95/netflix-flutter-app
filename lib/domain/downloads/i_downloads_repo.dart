import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/downloads/models/download.dart';

abstract class IDonloadsRepo {
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages();
}
