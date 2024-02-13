import 'package:dartz/dartz.dart';
import 'package:social_media_app/core/errors/dio_error.dart';
import 'package:social_media_app/features/home/data/models/post_model/post_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, PostModel>> getPosts({required String token});
  Future<Either<Failure, Map<String, dynamic>>> deletePost({required int id , required String token});
}
