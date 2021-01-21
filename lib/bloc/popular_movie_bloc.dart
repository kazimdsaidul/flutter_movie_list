import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_movie_list/model/PopularMovieList.dart';
import 'package:flutter_movie_list/network/repository.dart';
import 'package:meta/meta.dart';

part 'popular_movie_event.dart';

part 'popular_movie_state.dart';

class PopularMovieBloc extends Bloc<PopularMovieEvent, PopularMovieState> {
  PopularMovieBloc() : super(PopularMovieInitial());

  final _repository = Repository();

  @override
  Stream<PopularMovieState> mapEventToState(
    PopularMovieEvent event,
  ) async* {
    if (event is NeedData) {
      try {
        var fetchAllMovies = await _repository.fetchAllMovies();

        var results = fetchAllMovies.results;
        yield MovieList(results);
      } catch (mesage) {}
    } else {}
  }
}
