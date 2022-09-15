import 'package:get/get.dart';

import '../../domain/entities/genre_entity.dart';
import '../../domain/entities/movie_details_entity.dart';
import '../../domain/entities/similar_movies_entity.dart';
import '../../domain/usecases/get_all_genres_usecase.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/usecases/get_similar_movies_usecase.dart';

class MovieController extends GetxController {
  final IGetMovieDetailsUseCase _getMovieDetailsUseCase;
  final IGetSimilarMoviesUseCase _getSimilarMoviesUseCase;
  final IGetAllGenresUseCase _getAllGenresUseCase;
  MovieController({
    required IGetMovieDetailsUseCase getMovieDetailsUseCase,
    required IGetSimilarMoviesUseCase getSimilarMoviesUseCase,
    required IGetAllGenresUseCase getAllGenresUseCase,
  })  : _getMovieDetailsUseCase = getMovieDetailsUseCase,
        _getSimilarMoviesUseCase = getSimilarMoviesUseCase,
        _getAllGenresUseCase = getAllGenresUseCase;

  var isLoading = RxBool(false);
  var movieDetails = Rx<MovieDetails?>(null);
  var similarMovies = Rx<SimilarMovies?>(null);
  var genres = Rx<List<Genre>>([]);
  var liked = Rx<bool>(false);

  Future<void> getMovieDetails(int movieId) async {
    isLoading.value = true;
    final result = await _getMovieDetailsUseCase(movieId);
    result.fold(
      (l) => null,
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
      (l) => null,
      (r) {
        similarMovies.value = r;
      },
    );
    isLoading.value = false;
  }

  Future<void> loadAllGenres() async {
    isLoading.value = true;
    final result = await _getAllGenresUseCase();
    result.fold(
      (l) => null,
      (r) {
        genres.value = r;
      },
    );
    isLoading.value = false;
  }
}
