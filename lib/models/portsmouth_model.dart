import 'package:equatable/equatable.dart';

class PortsmouthModel extends Equatable {
  final String title;
  final String loa;
  final String dpn;

   PortsmouthModel({
    this.title = '',
    this.loa = '',
    this.dpn = '',
  });

  @override
  List<Object> get props => [title, loa, dpn];

  @override
  String toString() => 'PortsmouthModel(title: $title, loa: $loa, dpn: $dpn)';

  PortsmouthModel copyWith({
    String? title,
    String? loa,
    String? dpn,
  }) {
    return PortsmouthModel(
      title: title ?? this.title,
      loa: loa ?? this.loa,
      dpn: dpn ?? this.dpn,
    );
  }
}
