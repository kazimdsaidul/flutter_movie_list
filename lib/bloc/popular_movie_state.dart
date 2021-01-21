part of 'popular_movie_bloc.dart';

@immutable
abstract class PopularMovieState {}

class PopularMovieInitial extends PopularMovieState {}

class MovieList extends PopularMovieState {
  final List<Result> result;

  MovieList(this.result);
}

class Error extends PopularMovieState {
  final String message;

  Error(this.message);
}
