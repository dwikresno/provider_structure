class PopularModel {
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  PopularModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  PopularModel.fromJson(Map<String, dynamic> json) {
    page = json['page'] as int?;
    results = (json['results'] as List?)
        ?.map((dynamic e) => Results.fromJson(e as Map<String, dynamic>))
        .toList();
    totalPages = json['total_pages'] as int?;
    totalResults = json['total_results'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['page'] = page;
    json['results'] = results?.map((e) => e.toJson()).toList();
    json['total_pages'] = totalPages;
    json['total_results'] = totalResults;
    return json;
  }
}

class Results {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  var voteAverage;
  int? voteCount;

  Results({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  Results.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['adult'] = adult;
    json['backdrop_path'] = backdropPath;
    json['genre_ids'] = genreIds;
    json['id'] = id;
    json['original_language'] = originalLanguage;
    json['original_title'] = originalTitle;
    json['overview'] = overview;
    json['popularity'] = popularity;
    json['poster_path'] = posterPath;
    json['release_date'] = releaseDate;
    json['title'] = title;
    json['video'] = video;
    json['vote_average'] = voteAverage;
    json['vote_count'] = voteCount;
    return json;
  }
}
