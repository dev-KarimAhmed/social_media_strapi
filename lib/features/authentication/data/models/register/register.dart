import 'package:equatable/equatable.dart';

import 'user.dart';

class RegisterModel extends Equatable {
  final String? jwt;
  final User? user;

  const RegisterModel({this.jwt, this.user});

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
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
