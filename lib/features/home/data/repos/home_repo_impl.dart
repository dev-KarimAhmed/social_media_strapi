import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:social_media_app/core/errors/dio_error.dart';
import 'package:social_media_app/core/utils/api_services.dart';
import 'package:social_media_app/features/home/data/models/post_image/post_image.dart';
import 'package:social_media_app/features/home/data/models/post_model/post_model.dart';
import 'package:social_media_app/features/home/data/models/post_post_model/post_post_model.dart';
import 'package:social_media_app/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl(this.apiServices);

  @override
  Future<Either<Failure, PostModel>> getPosts({required String token}) async {
    try {
      var data = await apiServices.getPosts('posts?populate=*', token);
      PostModel posts = PostModel.fromJson(data);

      return right(posts);
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> deletePost(
      {required int id, required String token}) async {
    try {
      var data = await apiServices.deletePost('posts/$id', token);
      // PostModel posts = PostModel.fromJson(data);

      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PostPostModel>> post(
      {required String token, required Map<String, dynamic> apiData}) async {
    try {
      var data = await apiServices.post('posts', token, apiData);
      PostPostModel posts =
          PostPostModel.fromJson(data.data as Map<String, dynamic>);

      return right(posts);
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PostImage>> uploadImageToPost(
      {required String token,
      required Map<String, dynamic> apiImagePostData}) async {
    try {
      var data = await apiServices.uploadImageToPost(
          'upload', token, apiImagePostData);
      PostImage postImage = PostImage.fromJson(data as Map<String, dynamic>);

      return right(postImage);
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> addPost(
      {required String token,
      required String name,
      required String description,
      required String user,
      required File? image}) async {
    try {
      var data = await apiServices.addPost(
        endPoint: 'posts',
        token: token,
        name: name,
        description: description,
        user: user,
        image: image,
      );

      return right(data.data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(e.toString()));
    }
  }
}
