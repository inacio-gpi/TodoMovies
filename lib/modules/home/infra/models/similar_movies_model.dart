import 'dart:convert';

import '../../domain/entities/similar_movies_entity.dart';

class SimilarMoviesModel {
  final int page;
  final List<ResultsModel> results;
  final int totalPages;
  final int totalResults;

  SimilarMoviesModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
      'results': results.map((x) => x.toMap()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }

  factory SimilarMoviesModel.fromMap(Map<String, dynamic> map) {
    return SimilarMoviesModel(
      page: map['page'],
      results: List<ResultsModel>.from(
        map['results'].map(
          (x) => ResultsModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      totalPages: map['total_pages'],
      totalResults: map['total_results'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SimilarMoviesModel.fromJson(String source) =>
      SimilarMoviesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  SimilarMovies toEntity() => SimilarMovies(
        page: page,
        results: results.map((e) => e.toEntity()).toList(),
        totalPages: totalPages,
        totalResults: totalResults,
      );
}

class ResultsModel {
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

  ResultsModel({
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'posterPath': posterPath,
      'adult': adult,
      'overview': overview,
      'releaseDate': releaseDate,
      'genreIds': genreIds,
      'id': id,
      'originalTitle': originalTitle,
      'originalLanguage': originalLanguage,
      'title': title,
      'backdropPath': backdropPath,
      'popularity': popularity,
      'voteCount': voteCount,
      'video': video,
      'voteAverage': voteAverage,
    };
  }

  factory ResultsModel.fromMap(Map<String, dynamic> map) {
    return ResultsModel(
      posterPath: map['poster_path'],
      adult: map['adult'],
      overview: map['overview'],
      releaseDate: DateTime.parse(map['release_date']),
      genreIds: List<int>.from((map['genre_ids'])),
      id: map['id'],
      originalTitle: map['original_title'],
      originalLanguage: map['original_language'],
      title: map['title'],
      backdropPath: map['backdrop_path'],
      popularity: map['popularity'],
      voteCount: map['vote_count'],
      video: map['video'],
      voteAverage: map['vote_average'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultsModel.fromJson(String source) =>
      ResultsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  Results toEntity() => Results(
        posterPath: posterPath,
        adult: adult,
        overview: overview,
        releaseDate: releaseDate,
        genreIds: genreIds,
        id: id,
        originalTitle: originalTitle,
        originalLanguage: originalLanguage,
        title: title,
        backdropPath: backdropPath,
        popularity: popularity,
        voteCount: voteCount,
        video: video,
        voteAverage: voteAverage,
      );
}
