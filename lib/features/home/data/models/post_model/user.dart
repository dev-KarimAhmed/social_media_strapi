import 'package:equatable/equatable.dart';
import 'package:social_media_app/features/home/data/models/post_model/datum.dart';

class User extends Equatable {
  final Datum? datum;

  const User({this.datum});

  factory User.fromJson(Map<String, dynamic> json) => User(
        datum: json['data'] == null
            ? null
            : Datum.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'data': datum?.toJson(),
      };

  @override
  List<Object?> get props => [datum];
}
