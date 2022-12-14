abstract class ApiRoutes {
  static const String baseUrl = 'https://api.themoviedb.org';

  static const String _apiVersion = '/3';

  static const String movie = '$_apiVersion/movie';
  static const String genres = '$_apiVersion/genre/movie/list';
  static const String similar = '/similar';
}
