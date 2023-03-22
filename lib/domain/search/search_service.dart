import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/search/models/search/search.dart';

abstract class SearchService {
  Future<Either<MainFailure, Search>> searchMovies({
    required String movieQuery,
  });
}
