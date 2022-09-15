import 'package:get/get.dart';

import '../../domain/usecases/get_movie_details_usecase.dart';

class MovieController extends GetxController {
  final IGetMovieDetailsUseCase _getMovieDetailsUseCase;
  MovieController({
    required IGetMovieDetailsUseCase getMovieDetailsUseCase,
  }) : _getMovieDetailsUseCase = getMovieDetailsUseCase;

  var isFirstLoading = RxBool(true);

  Future<void> getMovieDetails(int movieId) async {
    final result = await _getMovieDetailsUseCase(movieId);
    result.fold(
      (l) {
        return null;
      },
      (r) {
        print(r);
      },
    );
  }
}
