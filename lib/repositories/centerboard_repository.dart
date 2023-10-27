import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:portsmouth_bloc/models/portsmouth_model.dart';

class CenterboardRepository {
  const CenterboardRepository(this.client);
  final Dio client; //left this in in case I use remote storage latter.
  Future<List<PortsmouthModel>> getCenterboard() async {
    try {
      final String centerboardData = await rootBundle.loadString('lib/src/centerboard.json');
      final centerboardDataJson = await jsonDecode(centerboardData);
      final centerboardList = List<PortsmouthModel>.of(
        centerboardDataJson['Centerboard'].map<PortsmouthModel>(
          (json) {
            return PortsmouthModel(
              title: json['Name'],
              dpn: json['DPN'],
              loa: json['LOA'], // this is not show in my Canva diagram.
            );
          },
        ),
      );
      return centerboardList;
    } catch (e) {
      throw e;
    }
  }
} //class
