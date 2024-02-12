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
  Future<Either<Failure, PostModel>> getPosts() async {
    try {
      var data = await apiServices.getPosts('posts?populate=*');
      PostModel posts = PostModel.fromJson(data);
      
      return right(posts);
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(e.toString()));
    }
  }
}
