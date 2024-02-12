import 'package:equatable/equatable.dart';

import 'image.dart';

class Attributes extends Equatable {
	final String? name;
	final String? description;
	final DateTime? createdAt;
	final DateTime? updatedAt;
	final DateTime? publishedAt;
	final Image? image;

	const Attributes({
		this.name, 
		this.description, 
		this.createdAt, 
		this.updatedAt, 
		this.publishedAt, 
		this.image, 
	});

	factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
				name: json['name'] as String?,
				description: json['description'] as String?,
				createdAt: json['createdAt'] == null
						? null
						: DateTime.parse(json['createdAt'] as String),
				updatedAt: json['updatedAt'] == null
						? null
						: DateTime.parse(json['updatedAt'] as String),
				publishedAt: json['publishedAt'] == null
						? null
						: DateTime.parse(json['publishedAt'] as String),
				image: json['image'] == null
						? null
						: Image.fromJson(json['image'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'name': name,
				'description': description,
				'createdAt': createdAt?.toIso8601String(),
				'updatedAt': updatedAt?.toIso8601String(),
				'publishedAt': publishedAt?.toIso8601String(),
				'image': image?.toJson(),
			};

	@override
	List<Object?> get props {
		return [
				name,
				description,
				createdAt,
				updatedAt,
				publishedAt,
				image,
		];
	}
}
