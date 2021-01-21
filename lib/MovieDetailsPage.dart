import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_list/model/PopularMovieList.dart';

class MovieDetailsPage extends StatelessWidget {
  Result product;
  final apiKey = 'b5551849719b4d25eefef7ea2e1564a8';

  MovieDetailsPage(Result product) {
    this.product = product;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("" + product.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(
                "Movie Name: " + product.title,
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                "Original language: " + product.original_language,
              ),
              FadeInImage.assetNetwork(
                fit: BoxFit.cover,
                placeholder: 'assets/loading.gif',
                image: "https://image.tmdb.org/t/p/original" +
                    product.poster_path +
                    "?api_key=" +
                    apiKey,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Go back!'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
