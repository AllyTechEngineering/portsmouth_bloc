import 'package:equatable/equatable.dart';

class PortsmouthModel extends Equatable {
  final String boat;
  final String loa;
  final String dpn;

  PortsmouthModel({
    this.boat = '',
    this.loa = '',
    this.dpn = '',
  });

  @override
  List<Object> get props => [
        boat,
        loa,
        dpn,
      ];

  @override
  String toString() => 'PortsmouthModel(title: $boat, firstUrl: $loa, url: $dpn)';
  //
  // PortsmouthModel copyWith({
  //   String? title,
  //   String? loa,
  //   String? dpn,
  // }) {
  //   return PortsmouthModel(
  //     text: title ?? this.text,
  //     firsturl: loa ?? this.firsturl,
  //     url: dpn ?? this.url,
  //   );
  // }
}
// original model
// final String title;
// final String loa;
// final String dpn;
