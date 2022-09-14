import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/movie_details_entity.dart';
import '../repositories/movies_repository_interface.dart';

abstract class IGetMovieDetailsUseCase {
  Future<Either<Failure, MovieDetails>> call(int movieId);
}

class GetMovieDetailsUseCase implements IGetMovieDetailsUseCase {
  late final IMoviesRepository _repository;

  GetMovieDetailsUseCase({
    required IMoviesRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, MovieDetails>> call(int movieId) async {
    return await _repository.getMovieDetails(movieId);
  }
}
