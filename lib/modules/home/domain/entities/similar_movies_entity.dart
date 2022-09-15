class SimilarMovies {
  final int page;
  final List<Results> results;
  final int totalPages;
  final int totalResults;

  SimilarMovies({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
}

class Results {
  final String? posterPath;
  final bool adult;
  final String overview;
  final DateTime releaseDate;
  final List<int> genreIds;
  final int id;
  final String originalTitle;
  final String originalLanguage;
  final String title;
  final String? backdropPath;
  final double popularity;
  final int voteCount;
  final bool video;
  final double voteAverage;

  Results({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.releaseDate,
    required this.posterPath,
    required this.popularity,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
}
