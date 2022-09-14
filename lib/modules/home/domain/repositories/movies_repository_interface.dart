import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/movie_details_entity.dart';

abstract class IMoviesRepository {
  Future<Either<Failure, MovieDetails>> getMovieDetails(int movieId);
}
