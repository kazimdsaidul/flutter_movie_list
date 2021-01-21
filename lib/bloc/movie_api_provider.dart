import 'dart:async';
import 'dart:convert';

import 'package:flutter_movie_list/model/PopularMovieList.dart';
import "package:http/http.dart" show Client;


class MovieApiProvider {
  Client client = Client();
  final domain = "http://api.themoviedb.org";
  final apiKey = 'b5551849719b4d25eefef7ea2e1564a8';


  Future<PopularMovieList> fetchMovieList() async {
    print("entered");
    final response = await client
        .get(domain + "/3/movie/popular?api_key=$apiKey");
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return PopularMovieList.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}