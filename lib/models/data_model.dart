import 'package:equatable/equatable.dart';

class DataModel extends Equatable {
  final String boat;
  final String className;
  final String code;
  final String dpn;
  final String dpn1;
  final String dpn2;
  final String dpn3;
  final String dpn4;
  final String website;
  final String crewSize;
  final String oneDesign;
  final String loa;
  final String lwl;
  final String sailArea;
  final String beam;
  final String displacement;
  final String maxDraft;
  final String saDisp;
  final String balDisp;
  final String dispLen;
  final String capsizeRatio;
  final String hullSpeed;
  DataModel({
    this.boat = '',
    this.className = '',
    this.code = '',
    this.dpn = '',
    this.dpn1 = '',
    this.dpn2 = '',
    this.dpn3 = '',
    this.dpn4 = '',
    this.website = '',
    this.crewSize = '',
    this.oneDesign = '',
    this.loa = '',
    this.lwl = '',
    this.sailArea = '',
    this.beam = '',
    this.displacement = '',
    this.maxDraft = '',
    this.saDisp = '',
    this.balDisp = '',
    this.dispLen = '',
    this.capsizeRatio = '',
    this.hullSpeed = '',
  });

  @override
  List<Object> get props {
    return [
      boat,
      className,
      code,
      dpn,
      dpn1,
      dpn2,
      dpn3,
      dpn4,
      website,
      crewSize,
      oneDesign,
      loa,
      lwl,
      sailArea,
      beam,
      displacement,
      maxDraft,
      saDisp,
      balDisp,
      dispLen,
      capsizeRatio,
      hullSpeed,
    ];
  }

  @override
  String toString() {
    return 'DataModel(boat: $boat, className: $className, code: $code, dpn: $dpn, dpn1: $dpn1, dpn2: $dpn2, dpn3: $dpn3, dpn4: $dpn4, website: $website, crewSize: $crewSize, oneDesign: $oneDesign, loa: $loa, lwl: $lwl, sailArea: $sailArea, beam: $beam, displacement: $displacement, maxDraft: $maxDraft, saDisp: $saDisp, balDisp: $balDisp, dispLen: $dispLen, capsizeRatio: $capsizeRatio, hullSpeed: $hullSpeed)';
  }

  DataModel copyWith({
    String? boat,
    String? className,
    String? code,
    String? dpn,
    String? dpn1,
    String? dpn2,
    String? dpn3,
    String? dpn4,
    String? website,
    String? crewSize,
    String? oneDesign,
    String? loa,
    String? lwl,
    String? sailArea,
    String? beam,
    String? displacement,
    String? maxDraft,
    String? saDisp,
    String? balDisp,
    String? dispLen,
    String? capsizeRatio,
    String? hullSpeed,
  }) {
    return DataModel(
      boat: boat ?? this.boat,
      className: className ?? this.className,
      code: code ?? this.code,
      dpn: dpn ?? this.dpn,
      dpn1: dpn1 ?? this.dpn1,
      dpn2: dpn2 ?? this.dpn2,
      dpn3: dpn3 ?? this.dpn3,
      dpn4: dpn4 ?? this.dpn4,
      website: website ?? this.website,
      crewSize: crewSize ?? this.crewSize,
      oneDesign: oneDesign ?? this.oneDesign,
      loa: loa ?? this.loa,
      lwl: lwl ?? this.lwl,
      sailArea: sailArea ?? this.sailArea,
      beam: beam ?? this.beam,
      displacement: displacement ?? this.displacement,
      maxDraft: maxDraft ?? this.maxDraft,
      saDisp: saDisp ?? this.saDisp,
      balDisp: balDisp ?? this.balDisp,
      dispLen: dispLen ?? this.dispLen,
      capsizeRatio: capsizeRatio ?? this.capsizeRatio,
      hullSpeed: hullSpeed ?? this.hullSpeed,
    );
  }
}
