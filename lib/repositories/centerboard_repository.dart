import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:portsmouth_bloc/models/data_model.dart';

class CenterboardRepository {
  const CenterboardRepository(this.client);
  final Dio client; //left this in in case I use remote storage latter.
  // add change to getCenterboard(String dataFile) to pass the switch selection: centerboard or keelboat or multihull or offshore.
  Future<List<DataModel>> getCenterboard() async {
    try {
      final String centerboardData = await rootBundle.loadString('lib/src/centerboard.json');
      final centerboardDataJson = await jsonDecode(centerboardData);
      final centerboardList = List<DataModel>.of(
        centerboardDataJson['Centerboard'].map<DataModel>(
          (json) {
            return DataModel(
              boat: json['Boat'],
              dpn: json['DPN'],
              loa: json['LOA'],
            );
          },
        ),
        // centerboardDataJson['Centerboard'].map<PortsmouthModel>(
        //   (json) {
        //     return PortsmouthModel(
        //       text: json['Name'],
        //       url: json['DPN'],
        //       firsturl: json['LOA'], // this is not show in my Canva diagram.
        //     );
        //   },
        // ),
      );
      return centerboardList;
    } catch (e) {
      print('This is the error e: $e');
      throw e;
    }
  }
} //class
