import 'package:equatable/equatable.dart';

class Pagination extends Equatable {
  final int? page;
  final int? pageSize;
  final int? pageCount;
  final int? total;

  const Pagination({this.page, this.pageSize, this.pageCount, this.total});

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json['page'] as int?,
        pageSize: json['pageSize'] as int?,
        pageCount: json['pageCount'] as int?,
        total: json['total'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'page': page,
        'pageSize': pageSize,
        'pageCount': pageCount,
        'total': total,
      };

  @override
  List<Object?> get props => [page, pageSize, pageCount, total];
}
