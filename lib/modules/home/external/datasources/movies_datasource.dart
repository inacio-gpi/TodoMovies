import 'package:todo_movies/modules/home/infra/models/genre_model.dart';
import 'package:todo_movies/modules/home/infra/models/similar_movies_model.dart';

import '../../../../core/constants/api_routes.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/http/http_interface.dart';
import '../../infra/datasources/movies_datasource_interface.dart';
import '../../infra/models/movie_details_model.dart';

class MoviesDataSource extends IMoviesDataSource {
  final IHttpClient _http;

  MoviesDataSource({required IHttpClient http}) : _http = http;

  @override
  Future<MovieDetailsModel> getMovieDetails(int movieId) async {
    final response = await _http.get(
      ApiRoutes.movie + "/" + movieId.toString(),
    );

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromMap(response.data);
    } else {
      throw DataSourceException(message: response.statusMessage.toString());
    }
  }

  @override
  Future<SimilarMoviesModel> getSimilarMovies(int movieId) async {
    final response = await _http.get(
      ApiRoutes.movie + "/" + movieId.toString() + ApiRoutes.similar,
    );

    if (response.statusCode == 200) {
      return SimilarMoviesModel.fromMap(response.data);
    } else {
      throw DataSourceException(message: response.statusMessage.toString());
    }
  }

  @override
  Future<List<GenreModel>> getAllGenres() async {
    final response = await _http.get(
      ApiRoutes.genres,
    );

    if (response.statusCode == 200) {
      final listGenres = response.data['genres'] as List;
      return listGenres.map((e) => GenreModel.fromMap(e)).toList();
    } else {
      throw DataSourceException(message: response.statusMessage.toString());
    }
  }
}
