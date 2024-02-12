import 'package:equatable/equatable.dart';

import 'attributes.dart';

class Datum extends Equatable {
	final int? id;
	final Attributes? attributes;

	const Datum({this.id, this.attributes});

	factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
