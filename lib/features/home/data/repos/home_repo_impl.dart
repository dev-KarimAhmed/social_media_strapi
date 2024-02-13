import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:social_media_app/core/errors/dio_error.dart';
import 'package:social_media_app/core/utils/api_services.dart';
import 'package:social_media_app/features/home/data/models/post_model/post_model.dart';
import 'package:social_media_app/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl(this.apiServices);

  @override
  Future<Either<Failure, PostModel>> getPosts({required String token}) async {
    try {
      var data = await apiServices.getPosts('posts?populate=*' , token);
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
      {required int id , required String token}) async {
    try {
      var data = await apiServices.deletePost('posts/$id' ,token);
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
  Future<Either<Failure, Map<String, dynamic>>> post({required String token, required Map<String, dynamic> apiData})async {
    try {
      var data = await apiServices.post('posts' , token , apiData);
      // PostModel posts = PostModel.fromJson(data);

      return right(data.extra);
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(e.toString()));
    }
  }
}
