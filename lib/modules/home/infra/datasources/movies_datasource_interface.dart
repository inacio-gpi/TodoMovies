import '../models/movie_details_model.dart';

abstract class IMoviesDataSource {
  Future<MovieDetailsModel> getMovieDetails(int movieId);
}
