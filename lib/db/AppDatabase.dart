import 'dart:async';

import 'package:floor/floor.dart';
import 'package:flutter_movie_list/db/ResultDao.dart';
import 'package:flutter_movie_list/model/PopularMovieList.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'AppDatabase.g.dart';

@Database(version: 1, entities: [Result])
abstract class AppDatabase extends FloorDatabase {
  ResultDao get resultDao;
}
