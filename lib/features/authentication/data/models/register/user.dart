import 'package:equatable/equatable.dart';

class User extends Equatable {
	final int? id;
	final String? username;
	final String? email;
	final String? provider;
	final bool? confirmed;
	final bool? blocked;
	final DateTime? createdAt;
	final DateTime? updatedAt;

	const User({
		this.id, 
		this.username, 
		this.email, 
		this.provider, 
		this.confirmed, 
		this.blocked, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory User.fromJson(Map<String, dynamic> json) => User(
				id: json['id'] as int?,
				username: json['username'] as String?,
				email: json['email'] as String?,
				provider: json['provider'] as String?,
				confirmed: json['confirmed'] as bool?,
				blocked: json['blocked'] as bool?,
				createdAt: json['createdAt'] == null
						? null
						: DateTime.parse(json['createdAt'] as String),
				updatedAt: json['updatedAt'] == null
						? null
						: DateTime.parse(json['updatedAt'] as String),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'username': username,
				'email': email,
				'provider': provider,
				'confirmed': confirmed,
				'blocked': blocked,
				'createdAt': createdAt?.toIso8601String(),
				'updatedAt': updatedAt?.toIso8601String(),
			};

	@override
	List<Object?> get props {
		return [
				id,
				username,
				email,
				provider,
				confirmed,
				blocked,
				createdAt,
				updatedAt,
		];
	}
}
