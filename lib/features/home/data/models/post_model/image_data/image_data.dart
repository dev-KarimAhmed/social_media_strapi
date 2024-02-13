import 'package:equatable/equatable.dart';

import 'attributes.dart';

class ImageData extends Equatable {
  final int? id;
  final Attributes? attributes;

  const ImageData({this.id, this.attributes});

  factory ImageData.fromJson(Map<String, dynamic> json) => ImageData(
        id: json['id'] as int?,
        attributes: json['attributes'] == null
            ? null
            : Attributes.fromJson(json['attributes'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'attributes': attributes?.toJson(),
      };

  @override
  List<Object?> get props => [id, attributes];
}
