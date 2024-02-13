import 'package:equatable/equatable.dart';

import 'pagination.dart';

class Meta extends Equatable {
  final Pagination? pagination;

  const Meta({this.pagination});

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: json['pagination'] == null
            ? null
            : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'pagination': pagination?.toJson(),
      };

  @override
  List<Object?> get props => [pagination];
}
