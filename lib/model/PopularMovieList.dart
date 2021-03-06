import 'package:floor/floor.dart';

class PopularMovieList {
  num page;
  List<Result> results;
  num total_pages;
  num total_results;

  PopularMovieList(
      {this.page, this.results, this.total_pages, this.total_results});

  factory PopularMovieList.fromJson(Map<String, dynamic> json) {
    return PopularMovieList(
      page: json['page'],
      results: json['results'] != null
          ? (json['results'] as List).map((i) => Result.fromJson(i)).toList()
          : null,
      total_pages: json['total_pages'],
      total_results: json['total_results'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['total_pages'] = this.total_pages;
    data['total_results'] = this.total_results;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@entity
class Result {
  @primaryKey
  final int id;

  bool adult;
  String backdrop_path;

  @ignore
  List<int> genre_ids;
  String original_language;
  String original_title;
  String overview;
  double popularity;
  String poster_path;
  String release_date;
  String title;
  bool video;
  int vote_count;

  Result(
      {this.adult,
      this.backdrop_path,
      this.genre_ids,
      this.id,
      this.original_language,
      this.original_title,
      this.overview,
      this.popularity,
      this.poster_path,
      this.release_date,
      this.title,
      this.video,
      this.vote_count});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      adult: json['adult'],
      backdrop_path: json['backdrop_path'],
      genre_ids: json['genre_ids'] != null
          ? new List<int>.from(json['genre_ids'])
          : null,
      id: json['id'],
      original_language: json['original_language'],
      original_title: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      poster_path: json['poster_path'],
      release_date: json['release_date'],
      title: json['title'],
      video: json['video'],
      vote_count: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdrop_path;
    data['id'] = this.id;
    data['original_language'] = this.original_language;
    data['original_title'] = this.original_title;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity;
    data['poster_path'] = this.poster_path;
    data['release_date'] = this.release_date;
    data['title'] = this.title;
    data['video'] = this.video;
    data['vote_count'] = this.vote_count;
    if (this.genre_ids != null) {
      data['genre_ids'] = this.genre_ids;
    }
    return data;
  }
}