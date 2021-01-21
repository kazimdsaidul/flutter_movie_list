import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/popular_movie_bloc.dart';

class PopularMovieList extends StatefulWidget {
  @override
  _PopularMovieListState createState() => _PopularMovieListState();
}

class _PopularMovieListState extends State<PopularMovieList> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PopularMovieBloc>(context).add(NeedData());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<PopularMovieBloc, PopularMovieState>(
          builder: (context, snapshot) {
        if (snapshot is MovieList) {
          return Text("done${snapshot.result.length}");
        } else {
          return Text("Popular list");
        }
      }),
    );
  }
}
