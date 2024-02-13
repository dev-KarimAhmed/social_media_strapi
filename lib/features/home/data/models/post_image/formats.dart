import 'package:equatable/equatable.dart';

import 'thumbnail.dart';

class Formats extends Equatable {
  final Thumbnail? thumbnail;

  const Formats({this.thumbnail});

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        thumbnail: json['thumbnail'] == null
            ? null
            : Thumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'thumbnail': thumbnail?.toJson(),
      };

  @override
  List<Object?> get props => [thumbnail];
}
