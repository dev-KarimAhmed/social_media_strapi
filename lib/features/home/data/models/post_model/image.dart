import 'package:equatable/equatable.dart';
import 'package:social_media_app/features/home/data/models/post_model/image_data/image_data.dart';

class Image extends Equatable {
  final ImageData? imageData;

  const Image({this.imageData});

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        imageData: json['data'] == null
            ? null
            : ImageData.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'data': imageData?.toJson(),
      };

  @override
  List<Object?> get props => [imageData];
}
