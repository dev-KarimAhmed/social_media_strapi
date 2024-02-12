import 'package:equatable/equatable.dart';

import 'datum.dart';
import 'meta.dart';

class PostModel extends Equatable {
	final List<Datum>? data;
	final Meta? meta;

	const PostModel({this.data, this.meta});

	factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
				data: (json['data'] as List<dynamic>?)
						?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
						.toList(),
				meta: json['meta'] == null
						? null
						: Meta.fromJson(json['meta'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'data': data?.map((e) => e.toJson()).toList(),
				'meta': meta?.toJson(),
			};

	@override
	List<Object?> get props => [data, meta];
}
