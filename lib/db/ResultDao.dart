import 'package:floor/floor.dart';
import 'package:flutter_movie_list/model/PopularMovieList.dart';

@dao
abstract class ResultDao {
  @Query('SELECT * FROM Result')
  Future<List<Result>> findAllPersons();

  @Query('SELECT * FROM Result WHERE id = :id')
  Stream<Result> findPersonById(int id);

  @insert
  Future<void> insertPerson(Result person);

  @insert
  Future<void> insertAllPerson(List<Result> person);
}
