import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/genre_entity.dart';
import '../repositories/movies_repository_interface.dart';

abstract class IGetAllGenresUseCase {
  Future<Either<Failure, List<Genre>>> call();
}

class GetAllGenresUseCase implements IGetAllGenresUseCase {
  late final IMoviesRepository _repository;

  GetAllGenresUseCase({
    required IMoviesRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, List<Genre>>> call() async {
    return await _repository.getAllGenres();
  }
}
