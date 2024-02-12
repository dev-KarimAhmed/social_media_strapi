import 'package:equatable/equatable.dart';

import 'data.dart';

class Image extends Equatable {
	final Data? data;

	const Image({this.data});

	factory Image.fromJson(Map<String, dynamic> json) => Image(
				data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'data': data?.toJson(),
			};

	@override
	List<Object?> get props => [data];
}
