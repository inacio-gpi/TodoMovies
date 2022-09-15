// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../domain/entities/movie_details_entity.dart';

class MovieDetailsModel {
  final bool adult;
  final String? backdropPath;
  final BelongsToCollectionModel? belongsToCollection;
  final int budget;
  final List<GenresModel> genres;
  final String? homepage;
  final int id;
  final String? imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<ProductionCompaniesModel> productionCompanies;
  final List<ProductionCountriesModel> productionCountries;
  final DateTime releaseDate;
  final int revenue;
  final int? runtime;
  final List<SpokenLanguagesModel> spokenLanguages;
  final String status;
  final String? tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;
  MovieDetailsModel({
    required this.adult,
    this.backdropPath,
    this.belongsToCollection,
    required this.budget,
    required this.genres,
    this.homepage,
    required this.id,
    this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    this.runtime,
    required this.spokenLanguages,
    required this.status,
    this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adult': adult,
      'backdrop_path': backdropPath,
      'belongs_to_collection': belongsToCollection,
      'budget': budget,
      'genres': genres.map((x) => x.toMap()).toList(),
      'homepage': homepage,
      'id': id,
      'imdb_id': imdbId,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'production_companies':
          productionCompanies.map((x) => x.toMap()).toList(),
      'production_countries':
          productionCountries.map((x) => x.toMap()).toList(),
      'release_date': releaseDate.millisecondsSinceEpoch,
      'revenue': revenue,
      'runtime': runtime,
      'spoken_languages': spokenLanguages.map((x) => x.toMap()).toList(),
      'status': status,
      'tagline': tagline,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  factory MovieDetailsModel.fromMap(Map<String, dynamic> map) {
    return MovieDetailsModel(
      adult: map['adult'] as bool,
      backdropPath:
          map['backdrop_path'] != null ? map['backdrop_path'] as String : null,
      belongsToCollection:
          BelongsToCollectionModel.fromMap(map['belongs_to_collection']),
      budget: map['budget'] as int,
      genres: List<GenresModel>.from(
        map['genres'].map(
          (x) => GenresModel.fromMap(x),
        ),
      ),
      homepage: map['homepage'] != null ? map['homepage'] as String : null,
      id: map['id'] as int,
      imdbId: map['imdb_id'] != null ? map['imdb_id'] as String : null,
      originalLanguage: map['original_language'] as String,
      originalTitle: map['original_title'] as String,
      overview: map['overview'] != null ? map['overview'] as String : null,
      popularity:
          map['popularity'] != null ? map['popularity'] as double : null,
      posterPath:
          map['poster_path'] != null ? map['poster_path'] as String : null,
      productionCompanies: List<ProductionCompaniesModel>.from(
        map['production_companies'].map<ProductionCompaniesModel>(
          (x) => ProductionCompaniesModel.fromMap(x),
        ),
      ),
      productionCountries: List<ProductionCountriesModel>.from(
        map['production_countries'].map<ProductionCountriesModel>(
          (x) => ProductionCountriesModel.fromMap(x),
        ),
      ),
      releaseDate: DateTime.parse(map['release_date']),
      revenue: map['revenue'] as int,
      runtime: map['runtime'] != null ? map['runtime'] as int : null,
      spokenLanguages: List<SpokenLanguagesModel>.from(
        map['spoken_languages'].map<SpokenLanguagesModel>(
          (x) => SpokenLanguagesModel.fromMap(x),
        ),
      ),
      status: map['status'] as String,
      tagline: map['tagline'] != null ? map['tagline'] as String : null,
      title: map['title'] as String,
      video: map['video'] as bool,
      voteAverage: map['vote_average'] as double,
      voteCount: map['vote_count'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieDetailsModel.fromJson(String source) =>
      MovieDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  MovieDetails toEntity() => MovieDetails(
        adult: adult,
        backdropPath: backdropPath,
        belongsToCollection: belongsToCollection?.toEntity(),
        budget: budget,
        genres: genres.map((e) => e.toEntity()).toList(),
        homepage: homepage,
        id: id,
        imdbId: imdbId,
        originalLanguage: originalLanguage,
        originalTitle: originalTitle,
        overview: overview,
        popularity: popularity,
        posterPath: posterPath,
        productionCompanies:
            productionCompanies.map((e) => e.toEntity()).toList(),
        productionCountries:
            productionCountries.map((e) => e.toEntity()).toList(),
        releaseDate: releaseDate,
        revenue: revenue,
        runtime: runtime,
        spokenLanguages: spokenLanguages.map((e) => e.toEntity()).toList(),
        status: status,
        tagline: tagline,
        title: title,
        video: video,
        voteAverage: voteAverage,
        voteCount: voteCount,
      );
}

class BelongsToCollectionModel {
  final int id;
  final String name;
  final String posterPath;
  final String backdropPath;
  BelongsToCollectionModel({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.backdropPath,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'poster_path': posterPath,
      'backdrop_path': backdropPath,
    };
  }

  factory BelongsToCollectionModel.fromMap(Map<String, dynamic> map) {
    return BelongsToCollectionModel(
      id: map['id'],
      name: map['name'],
      posterPath: map['poster_path'],
      backdropPath: map['backdrop_path'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BelongsToCollectionModel.fromJson(String source) =>
      BelongsToCollectionModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  BelongsToCollection toEntity() => BelongsToCollection(
        id: id,
        name: name,
        posterPath: posterPath,
        backdropPath: backdropPath,
      );
}

class GenresModel {
  final int id;
  final String name;

  GenresModel({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory GenresModel.fromMap(Map<String, dynamic> map) {
    return GenresModel(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GenresModel.fromJson(String source) =>
      GenresModel.fromMap(json.decode(source) as Map<String, dynamic>);

  Genres toEntity() => Genres(
        id: id,
        name: name,
      );
}

class ProductionCompaniesModel {
  final int id;
  final String? logoPath;
  final String name;
  final String originCountry;

  ProductionCompaniesModel({
    required this.id,
    this.logoPath,
    required this.name,
    required this.originCountry,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'logo_path': logoPath,
      'name': name,
      'origin_country': originCountry,
    };
  }

  factory ProductionCompaniesModel.fromMap(Map<String, dynamic> map) {
    return ProductionCompaniesModel(
      id: map['id'] as int,
      logoPath: map['logo_path'] != null ? map['logo_path'] as String : null,
      name: map['name'] as String,
      originCountry: map['origin_country'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductionCompaniesModel.fromJson(String source) =>
      ProductionCompaniesModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  ProductionCompanies toEntity() => ProductionCompanies(
        id: id,
        logoPath: logoPath ?? '',
        name: name,
        originCountry: originCountry,
      );
}

class ProductionCountriesModel {
  final String iso31661;
  final String name;

  ProductionCountriesModel({
    required this.iso31661,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'iso_3166_1': iso31661,
      'name': name,
    };
  }

  factory ProductionCountriesModel.fromMap(Map<String, dynamic> map) {
    return ProductionCountriesModel(
      iso31661: map['iso_3166_1'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductionCountriesModel.fromJson(String source) =>
      ProductionCountriesModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  ProductionCountries toEntity() => ProductionCountries(
        iso31661: iso31661,
        name: name,
      );
}

class SpokenLanguagesModel {
  final String iso6391;
  final String name;

  SpokenLanguagesModel({
    required this.iso6391,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'iso_639_1': iso6391,
      'name': name,
    };
  }

  factory SpokenLanguagesModel.fromMap(Map<String, dynamic> map) {
    return SpokenLanguagesModel(
      iso6391: map['iso_639_1'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SpokenLanguagesModel.fromJson(String source) =>
      SpokenLanguagesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  SpokenLanguages toEntity() => SpokenLanguages(
        iso6391: iso6391,
        name: name,
      );
}
