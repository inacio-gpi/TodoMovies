import 'package:get/get.dart';
import 'package:todo_movies/modules/home/presenter/controller/movie_controller.dart';

import '../../core/http/http_client_adapter.dart';
import 'domain/usecases/get_all_genres_usecase.dart';
import 'domain/usecases/get_movie_details_usecase.dart';
import 'domain/usecases/get_similar_movies_usecase.dart';
import 'external/datasources/movies_datasource.dart';
import 'infra/repositories/movies_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MoviesDataSource(http: Get.find<HttpClient>()));
    Get.lazyPut(() => MoviesRepository(
          movieDataSource: Get.find<MoviesDataSource>(),
        ));
    Get.lazyPut(
        () => GetMovieDetailsUseCase(repository: Get.find<MoviesRepository>()));
    Get.lazyPut(() =>
        GetSimilarMoviesUseCase(repository: Get.find<MoviesRepository>()));
    Get.lazyPut(
        () => GetAllGenresUseCase(repository: Get.find<MoviesRepository>()));
    Get.lazyPut(() => MovieController(
          getMovieDetailsUseCase: Get.find<GetMovieDetailsUseCase>(),
          getSimilarMoviesUseCase: Get.find<GetSimilarMoviesUseCase>(),
          getAllGenresUseCase: Get.find<GetAllGenresUseCase>(),
        ));
  }
}
