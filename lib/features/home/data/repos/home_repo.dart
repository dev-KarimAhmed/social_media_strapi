import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:social_media_app/core/errors/dio_error.dart';
import 'package:social_media_app/features/home/data/models/post_image/post_image.dart';
import 'package:social_media_app/features/home/data/models/post_model/post_model.dart';
import 'package:social_media_app/features/home/data/models/post_post_model/post_post_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, PostModel>> getPosts({required String token});
  Future<Either<Failure, Map<String, dynamic>>> deletePost(
      {required int id, required String token});
  Future<Either<Failure, PostPostModel>> post(
      {required String token, required Map<String, dynamic> apiData});
  Future<Either<Failure, Map<String, dynamic>>> addPost({
    required String token,
    required String name,
    required String description,
    required String user,
    required File? image,

  });
  Future<Either<Failure, PostImage>> uploadImageToPost(
      {required String token, required Map<String, dynamic> apiImagePostData});
}
