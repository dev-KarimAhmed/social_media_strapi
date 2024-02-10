import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:social_media_app/core/errors/dio_error.dart';
import 'package:social_media_app/core/utils/api_services.dart';
import 'package:social_media_app/features/authentication/data/models/register/register.dart';
import 'package:social_media_app/features/authentication/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiServices apiServices;

  AuthRepoImpl(this.apiServices);

  @override
  Future<Either<Failure, RegisterModel>> register({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final Response<dynamic> data = await apiServices.register(
        'auth/local/register',
        {
          'username': username,
          'email': email,
          'password': password,
        },
      );

      final RegisterModel registerModel =
          RegisterModel.fromJson(data.data as Map<String, dynamic>);
      
      // Print statements for debugging
      print(data.data);
      print(data.extra);

      return right(registerModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerError.fromDioError(e));
      }
      return left(ServerError(e.toString()));
    }
  }
}
