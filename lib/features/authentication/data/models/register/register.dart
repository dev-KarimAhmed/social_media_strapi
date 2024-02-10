import 'package:equatable/equatable.dart';

import 'user.dart';

class AuthModel extends Equatable {
  final String? jwt;
  final User? user;

  const AuthModel({this.jwt, this.user});

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        jwt: json['jwt'] as String?,
        user: json['user'] == null ? null : User.fromJson(json['user']),
      );

  Map<String, dynamic> toJson() => {
        'jwt': jwt,
        'user': user?.toJson(),
      };

  @override
  List<Object?> get props => [jwt, user];
}
