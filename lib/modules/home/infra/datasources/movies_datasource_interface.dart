import '../models/genre_model.dart';
import '../models/movie_details_model.dart';
import '../models/similar_movies_model.dart';

abstract class IMoviesDataSource {
  Future<MovieDetailsModel> getMovieDetails(int movieId);
  Future<SimilarMoviesModel> getSimilarMovies(int movieId);
  Future<List<GenreModel>> getAllGenres();
}
