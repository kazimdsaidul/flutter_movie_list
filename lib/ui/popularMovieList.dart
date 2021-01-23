import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_list/ui/MovieDetailsPage.dart';

import '../bloc/popular_movie_bloc.dart';

class PopularMovieList extends StatefulWidget {
  @override
  _PopularMovieListState createState() => _PopularMovieListState();
}

class _PopularMovieListState extends State<PopularMovieList> {
  final apiKey = 'b5551849719b4d25eefef7ea2e1564a8';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<PopularMovieBloc, PopularMovieState>(
          builder: (context, snapshot) {
            if (snapshot is MovieList) {
          var listProject = snapshot.result;
          return ListView.builder(
              itemCount: listProject.length,
              itemBuilder: (context, index) {
                var product = listProject[index];

                return GestureDetector(
                  child: CachedNetworkImage(
                      imageUrl: "https://image.tmdb.org/t/p/original" +
                          product.poster_path +
                          "?api_key=" +
                          apiKey,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                      errorWidget: (context, url, error) => Icon(Icons.error)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MovieDetailsPage(product)),
                    );
                  },
                );
              });
        } else {
          BlocProvider.of<PopularMovieBloc>(context).add(NeedData());

          return Text("Popular list");
        }
      }),
    );
  }
}
