import 'package:equatable/equatable.dart';

import 'data.dart';
import 'meta.dart';

class PostPostModel extends Equatable {
  final Data? data;
  final Meta? meta;

  const PostPostModel({this.data, this.meta});

  factory PostPostModel.fromJson(Map<String, dynamic> json) => PostPostModel(
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
        // meta: json['meta'] == null
        //     ? null
        //     : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
        'meta': meta?.toJson(),
      };

  @override
  List<Object?> get props => [data, meta];
}
