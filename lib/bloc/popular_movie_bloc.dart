import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_movie_list/db/AppDatabase.dart';
import 'package:flutter_movie_list/db/ResultDao.dart';
import 'package:flutter_movie_list/model/PopularMovieList.dart';
import 'package:flutter_movie_list/network/repository.dart';
import 'package:meta/meta.dart';
import 'package:floor/floor.dart';

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
        final database =
            await $FloorAppDatabase.databaseBuilder('app_database.db').build();
        final resultDao = database.resultDao;
        var findAllPersons = resultDao.findAllPersons();
        var list = await findAllPersons;
        if (list != null && list.length > 0) {
          yield MovieList(list);
          var data = await callAPI(resultDao);
          yield MovieList(data);
        } else {
          var data = await callAPI(resultDao);
          yield MovieList(data);
        }
      } catch (mesage) {
        var test = 0;
      }
    } else {}
  }

  Future callAPI(ResultDao resultDao) async {
    var fetchAllMovies = await _repository.fetchAllMovies();
    var results = fetchAllMovies.results;
    resultDao.insertAllPerson(results);
    return results;
  }
}
