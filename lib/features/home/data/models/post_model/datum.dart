import 'package:equatable/equatable.dart';
import 'package:social_media_app/features/home/data/models/post_model/user_data.dart';

class Datum extends Equatable {
  final int? id;
  final UserData? userData;

  const Datum({this.id, this.userData});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        userData: json['attributes'] == null
            ? null
            : UserData.fromJson(json['attributes'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'userData': userData?.toJson(),
      };

  @override
  List<Object?> get props => [id, userData];
}
