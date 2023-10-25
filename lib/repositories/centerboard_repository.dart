import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:portsmouth_bloc/models/portsmouth_model.dart';

class CenterboardRepository {
  const CenterboardRepository(this.client);

  final Dio client;

  Future<List<PortsmouthModel>> getCenterboard() async {
    try {
      // final url =
      //     'https://api.themoviedb.org/3/trending/movie/week?api_key=060e7c76aff06a20ca4a875981216f3f';

      // final response = await client.get(url); // not used

      /// test code to see if I can read in a local json file
      final String centerboardData = await rootBundle.loadString('lib/src/centerboard.json');
      final centerboardDataJson = await jsonDecode(centerboardData);

      /// end test code
      final centerboardList = List<PortsmouthModel>.of(
        // response.data['results'].map<MovieModel>( // not used
        // fileDataTest['results'].map<MovieModel>(
        centerboardDataJson['Centerboard'].map<PortsmouthModel>(
          (json) {
            return PortsmouthModel(
              title: json['Name'],
              dpn: json['DPN'],
              loa: json['LOA'],
              // urlImage: 'https://image.tmdb.org/t/p/w185${json['poster_path']}',
            );
          },
        ),
      );
      print(centerboardDataJson.toString()); // prints the JSON file
      print('This is the JSON data: ${centerboardDataJson.toString()}');
      return centerboardList;
    } catch (e) {
      throw e;
    }
  } //getMovies
} //class
