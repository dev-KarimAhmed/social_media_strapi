import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:social_media_app/core/utils/api_services.dart';
import 'package:social_media_app/features/authentication/data/repos/auth_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio: Dio()));
  getIt.registerLazySingleton<AuthRepoImpl>(() => AuthRepoImpl(getIt<ApiServices>()));
}
