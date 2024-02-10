import 'package:dartz/dartz.dart';
import 'package:social_media_app/core/errors/dio_error.dart';
import 'package:social_media_app/features/authentication/data/models/register/register.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthModel>> register(
      {required String username,
      required String email,
      required String password});
  Future<Either<Failure, AuthModel>> login(
      {required String identifier, required String password});
}
