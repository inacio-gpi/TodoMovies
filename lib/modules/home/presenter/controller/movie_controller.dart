import 'package:get/get.dart';

import '../../domain/entities/movie_details_entity.dart';
import '../../domain/entities/similar_movies_entity.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/usecases/get_similar_movies_usecase.dart';

class MovieController extends GetxController {
  final IGetMovieDetailsUseCase _getMovieDetailsUseCase;
  final IGetSimilarMoviesUseCase _getSimilarMoviesUseCase;
  MovieController({
    required IGetMovieDetailsUseCase getMovieDetailsUseCase,
    required IGetSimilarMoviesUseCase getSimilarMoviesUseCase,
  })  : _getMovieDetailsUseCase = getMovieDetailsUseCase,
        _getSimilarMoviesUseCase = getSimilarMoviesUseCase;

  var isLoading = RxBool(false);
  var movieDetails = Rx<MovieDetails?>(null);
  var similarMovies = Rx<SimilarMovies?>(null);

  Future<void> getMovieDetails(int movieId) async {
    isLoading.value = true;
    final result = await _getMovieDetailsUseCase(movieId);
    result.fold(
      (l) {
        return null;
      },
      (r) {
        movieDetails.value = r;
      },
    );
    isLoading.value = false;
  }

  Future<void> loadSimilarMovies(int movieId) async {
    isLoading.value = true;
    final result = await _getSimilarMoviesUseCase(movieId);
    result.fold(
      (l) {
        return null;
      },
      (r) {
        similarMovies.value = r;
      },
    );
    isLoading.value = false;
  }
}
