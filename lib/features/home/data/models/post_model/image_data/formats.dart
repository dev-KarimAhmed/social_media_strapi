import 'package:equatable/equatable.dart';

import 'small.dart';
import 'thumbnail.dart';

class Formats extends Equatable {
  final Thumbnail? thumbnail;
  final Small? small;

  const Formats({this.thumbnail, this.small});

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        thumbnail: json['thumbnail'] == null
            ? null
            : Thumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>),
        small: json['small'] == null
            ? null
            : Small.fromJson(json['small'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'thumbnail': thumbnail?.toJson(),
        'small': small?.toJson(),
      };

  @override
  List<Object?> get props => [thumbnail, small];
}
