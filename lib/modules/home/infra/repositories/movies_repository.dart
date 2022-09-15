import 'package:dartz/dartz.dart';
import 'package:todo_movies/modules/home/domain/entities/similar_movies_entity.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/movie_details_entity.dart';
import '../../domain/repositories/movies_repository_interface.dart';
import '../datasources/movies_datasource_interface.dart';
import '../models/movie_details_model.dart';
import '../models/similar_movies_model.dart';

class MoviesRepository extends IMoviesRepository {
  final IMoviesDataSource _movieDataSource;

  MoviesRepository({
    required IMoviesDataSource movieDataSource,
  }) : _movieDataSource = movieDataSource;

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(int movieId) async {
    try {
      final MovieDetailsModel movieDetails =
          await _movieDataSource.getMovieDetails(movieId);

      final MovieDetails movieEntity = movieDetails.toEntity();

      return right(movieEntity);
    } on Failure catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, SimilarMovies>> getSimilarMovies(int movieId) async {
    try {
      final SimilarMoviesModel movieDetails =
          await _movieDataSource.getSimilarMovies(movieId);

      final SimilarMovies movieEntity = movieDetails.toEntity();

      return right(movieEntity);
    } on Failure catch (e) {
      return left(e);
    }
  }
}
