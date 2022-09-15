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
      throw DatasourceException(message: response.statusMessage.toString());
    }
  }
}
