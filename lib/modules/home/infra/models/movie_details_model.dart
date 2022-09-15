import 'dart:convert';

import '../../domain/entities/movie_details_entity.dart';

class MovieDetailsModel {
  final bool adult;
  final String? backdropPath;
  final String? belongsToCollection;
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
      'backdropPath': backdropPath,
      'belongsToCollection': belongsToCollection,
      'budget': budget,
      'genres': genres.map((x) => x.toMap()).toList(),
      'homepage': homepage,
      'id': id,
      'imdbId': imdbId,
      'originalLanguage': originalLanguage,
      'originalTitle': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'posterPath': posterPath,
      'productionCompanies': productionCompanies.map((x) => x.toMap()).toList(),
      'productionCountries': productionCountries.map((x) => x.toMap()).toList(),
      'releaseDate': releaseDate.millisecondsSinceEpoch,
      'revenue': revenue,
      'runtime': runtime,
      'spokenLanguages': spokenLanguages.map((x) => x.toMap()).toList(),
      'status': status,
      'tagline': tagline,
      'title': title,
      'video': video,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
    };
  }

  factory MovieDetailsModel.fromMap(Map<String, dynamic> map) {
    return MovieDetailsModel(
      adult: map['adult'] as bool,
      backdropPath:
          map['backdropPath'] != null ? map['backdropPath'] as String : null,
      belongsToCollection: map['belongsToCollection'] != null
          ? map['belongsToCollection'] as String
          : null,
      budget: map['budget'] as int,
      genres: List<GenresModel>.from(
        (map['genres'] as List<int>).map<GenresModel>(
          (x) => GenresModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      homepage: map['homepage'] != null ? map['homepage'] as String : null,
      id: map['id'] as int,
      imdbId: map['imdbId'] != null ? map['imdbId'] as String : null,
      originalLanguage: map['originalLanguage'] as String,
      originalTitle: map['originalTitle'] as String,
      overview: map['overview'] != null ? map['overview'] as String : null,
      popularity:
          map['popularity'] != null ? map['popularity'] as double : null,
      posterPath:
          map['posterPath'] != null ? map['posterPath'] as String : null,
      productionCompanies: List<ProductionCompaniesModel>.from(
        (map['productionCompanies'] as List<int>).map<ProductionCompaniesModel>(
          (x) => ProductionCompaniesModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      productionCountries: List<ProductionCountriesModel>.from(
        (map['productionCountries'] as List<int>).map<ProductionCountriesModel>(
          (x) => ProductionCountriesModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      releaseDate:
          DateTime.fromMillisecondsSinceEpoch(map['releaseDate'] as int),
      revenue: map['revenue'] as int,
      runtime: map['runtime'] != null ? map['runtime'] as int : null,
      spokenLanguages: List<SpokenLanguagesModel>.from(
        (map['spokenLanguages'] as List<int>).map<SpokenLanguagesModel>(
          (x) => SpokenLanguagesModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      status: map['status'] as String,
      tagline: map['tagline'] != null ? map['tagline'] as String : null,
      title: map['title'] as String,
      video: map['video'] as bool,
      voteAverage: map['voteAverage'] as double,
      voteCount: map['voteCount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieDetailsModel.fromJson(String source) =>
      MovieDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  MovieDetails toEntity() => MovieDetails(
        adult: adult,
        backdropPath: backdropPath,
        belongsToCollection: belongsToCollection,
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
      'logoPath': logoPath,
      'name': name,
      'originCountry': originCountry,
    };
  }

  factory ProductionCompaniesModel.fromMap(Map<String, dynamic> map) {
    return ProductionCompaniesModel(
      id: map['id'] as int,
      logoPath: map['logoPath'] != null ? map['logoPath'] as String : null,
      name: map['name'] as String,
      originCountry: map['originCountry'] as String,
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
      'iso31661': iso31661,
      'name': name,
    };
  }

  factory ProductionCountriesModel.fromMap(Map<String, dynamic> map) {
    return ProductionCountriesModel(
      iso31661: map['iso31661'] as String,
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
      'iso6391': iso6391,
      'name': name,
    };
  }

  factory SpokenLanguagesModel.fromMap(Map<String, dynamic> map) {
    return SpokenLanguagesModel(
      iso6391: map['iso6391'] as String,
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
