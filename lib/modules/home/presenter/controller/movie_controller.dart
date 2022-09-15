import 'package:get/get.dart';

import '../../domain/entities/movie_details_entity.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';

class MovieController extends GetxController {
  final IGetMovieDetailsUseCase _getMovieDetailsUseCase;
  MovieController({
    required IGetMovieDetailsUseCase getMovieDetailsUseCase,
  }) : _getMovieDetailsUseCase = getMovieDetailsUseCase;

  var isLoading = RxBool(false);
  var movieDetails = Rx<MovieDetails?>(null);

  Future<void> getMovieDetails(int movieId) async {
    isLoading.value = true;
    final result = await _getMovieDetailsUseCase(movieId);
    result.fold(
      (l) {
        return null;
      },
      (r) {
        movieDetails.value = r;
        print(movieDetails.value);
      },
    );
    isLoading.value = false;
  }
}
