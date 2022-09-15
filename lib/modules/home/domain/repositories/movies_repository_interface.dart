import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/genre_entity.dart';
import '../entities/movie_details_entity.dart';
import '../entities/similar_movies_entity.dart';

abstract class IMoviesRepository {
  Future<Either<Failure, MovieDetails>> getMovieDetails(int movieId);
  Future<Either<Failure, SimilarMovies>> getSimilarMovies(int movieId);
  Future<Either<Failure, List<Genre>>> getAllGenres();
}
