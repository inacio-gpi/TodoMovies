import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/similar_movies_entity.dart';
import '../repositories/movies_repository_interface.dart';

abstract class IGetSimilarMoviesUseCase {
  Future<Either<Failure, SimilarMovies>> call(int movieId);
}

class GetSimilarMoviesUseCase implements IGetSimilarMoviesUseCase {
  late final IMoviesRepository _repository;

  GetSimilarMoviesUseCase({
    required IMoviesRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, SimilarMovies>> call(int movieId) async {
    return await _repository.getSimilarMovies(movieId);
  }
}
