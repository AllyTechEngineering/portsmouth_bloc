import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
// import 'package:portsmouth_bloc/blocs/selection/selection_cubit.dart';
import 'package:portsmouth_bloc/models/data_model.dart';

class CenterboardRepository {
  CenterboardRepository(
    this.client,
  );
  final Dio client; //left this in in case I use remote storage latter.

  Future<List<DataModel>> getCenterboard(String jsonFileName) async {
    try {
      if (jsonFileName == 'lib/src/centerboard.json') {
        print('Testing in repo to see if the file name came: $jsonFileName');
        final String centerboardData = await rootBundle.loadString(jsonFileName);
        final centerboardDataJson = await jsonDecode(centerboardData);
        final centerboardList = List<DataModel>.of(
          centerboardDataJson['Centerboard'].map<DataModel>(
            (json) {
              return DataModel(
                boat: json['Boat'],
                className: json['Class'],
                code: json['Code'],
                dpn: json['DPN'],
                dpn1: json['DPN1'],
                dpn2: json['DPN2'],
                dpn3: json['DPN3'],
                dpn4: json['DPN4'],
                website: json['Website'],
                crewSize: json['CrewSize'],
                oneDesign: json['OneDesign'],
                loa: json['LOA'],
                lwl: json['LWL'],
                sailArea: json['SailArea'],
                beam: json['Beam'],
                displacement: json['Displacement'],
                maxDraft: json['MaxDraft'],
                saDisp: json['SA_Disp'],
                balDisp: json['Bal_Disp'],
                dispLen: json['Disp_Len'],
                capsizeRatio: json['CapsizeRatio'],
                hullSpeed: json['HullSpeed'],
              );
            },
          ),
        );
        return centerboardList;
      } else if (jsonFileName == 'lib/src/keelboat.json') {
        print('Testing in repo to see if the file name came: $jsonFileName');
        final String centerboardData = await rootBundle.loadString(jsonFileName);
        final centerboardDataJson = await jsonDecode(centerboardData);
        final centerboardList = List<DataModel>.of(
          centerboardDataJson['Keelboat'].map<DataModel>(
            (json) {
              return DataModel(
                boat: json['Boat'],
                className: json['Class'],
                code: json['Code'],
                dpn: json['DPN'],
                dpn1: json['DPN1'],
                dpn2: json['DPN2'],
                dpn3: json['DPN3'],
                dpn4: json['DPN4'],
                website: json['Website'],
                crewSize: json['CrewSize'],
                oneDesign: json['OneDesign'],
                loa: json['LOA'],
                lwl: json['LWL'],
                sailArea: json['SailArea'],
                beam: json['Beam'],
                displacement: json['Displacement'],
                maxDraft: json['MaxDraft'],
                saDisp: json['SA_Disp'],
                balDisp: json['Bal_Disp'],
                dispLen: json['Disp_Len'],
                capsizeRatio: json['CapsizeRatio'],
                hullSpeed: json['HullSpeed'],
              );
            },
          ),
        );
        return centerboardList;
      } else if (jsonFileName == 'lib/src/multihull.json') {
        print('Testing in repo to see if the file name came: $jsonFileName');
        final String centerboardData = await rootBundle.loadString(jsonFileName);
        final centerboardDataJson = await jsonDecode(centerboardData);
        final centerboardList = List<DataModel>.of(
          centerboardDataJson['Multihull'].map<DataModel>(
            (json) {
              return DataModel(
                boat: json['Boat'],
                className: json['Class'],
                code: json['Code'],
                dpn: json['DPN'],
                dpn1: json['DPN1'],
                dpn2: json['DPN2'],
                dpn3: json['DPN3'],
                dpn4: json['DPN4'],
                website: json['Website'],
                crewSize: json['CrewSize'],
                oneDesign: json['OneDesign'],
                loa: json['LOA'],
                lwl: json['LWL'],
                sailArea: json['SailArea'],
                beam: json['Beam'],
                displacement: json['Displacement'],
                maxDraft: json['MaxDraft'],
                saDisp: json['SA_Disp'],
                balDisp: json['Bal_Disp'],
                dispLen: json['Disp_Len'],
                capsizeRatio: json['CapsizeRatio'],
                hullSpeed: json['HullSpeed'],
              );
            },
          ),
        );
        return centerboardList;
      } else if (jsonFileName == 'lib/src/offshore.json') {
        print('Testing in repo to see if the file name came: $jsonFileName');
        final String centerboardData = await rootBundle.loadString(jsonFileName);
        final centerboardDataJson = await jsonDecode(centerboardData);
        final centerboardList = List<DataModel>.of(
          centerboardDataJson['Offshore'].map<DataModel>(
            (json) {
              return DataModel(
                boat: json['Boat'],
                className: json['Class'],
                code: json['Code'],
                dpn: json['DPN'],
                dpn1: json['DPN1'],
                dpn2: json['DPN2'],
                dpn3: json['DPN3'],
                dpn4: json['DPN4'],
                website: json['Website'],
                crewSize: json['CrewSize'],
                oneDesign: json['OneDesign'],
                loa: json['LOA'],
                lwl: json['LWL'],
                sailArea: json['SailArea'],
                beam: json['Beam'],
                displacement: json['Displacement'],
                maxDraft: json['MaxDraft'],
                saDisp: json['SA_Disp'],
                balDisp: json['Bal_Disp'],
                dispLen: json['Disp_Len'],
                capsizeRatio: json['CapsizeRatio'],
                hullSpeed: json['HullSpeed'],
              );
            },
          ),
        );
        return centerboardList;
      }
      final String centerboardData = await rootBundle.loadString(jsonFileName);
      final centerboardDataJson = await jsonDecode(centerboardData);
      final centerboardList = List<DataModel>.of(
        centerboardDataJson['Centerboard'].map<DataModel>(
          (json) {
            return DataModel(
              boat: json['Boat'],
              className: json['Class'],
              code: json['Code'],
              dpn: json['DPN'],
              dpn1: json['DPN1'],
              dpn2: json['DPN2'],
              dpn3: json['DPN3'],
              dpn4: json['DPN4'],
              website: json['Website'],
              crewSize: json['CrewSize'],
              oneDesign: json['OneDesign'],
              loa: json['LOA'],
              lwl: json['LWL'],
              sailArea: json['SailArea'],
              beam: json['Beam'],
              displacement: json['Displacement'],
              maxDraft: json['MaxDraft'],
              saDisp: json['SA_Disp'],
              balDisp: json['Bal_Disp'],
              dispLen: json['Disp_Len'],
              capsizeRatio: json['CapsizeRatio'],
              hullSpeed: json['HullSpeed'],
            );
          },
        ),
      );
      return centerboardList;
    } catch (e) {
      print('This is the error e: $e');
      throw e;
    }
  }
} //class
