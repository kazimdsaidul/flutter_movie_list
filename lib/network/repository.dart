import 'dart:async';

import 'package:flutter_movie_list/model/PopularMovieList.dart';

import '../bloc/movie_api_provider.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<PopularMovieList> fetchAllMovies() =>
      moviesApiProvider.fetchMovieList();
}