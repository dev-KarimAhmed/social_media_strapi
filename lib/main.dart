import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media_app/constants.dart';
import 'package:social_media_app/core/utils/bloc_observer.dart';
import 'package:social_media_app/core/utils/services_locator.dart';
import 'package:social_media_app/features/authentication/data/repos/auth_repo_impl.dart';
import 'package:social_media_app/features/authentication/presentation/view_model/auth_cubit/authentcation_cubit.dart';
import 'package:social_media_app/features/authentication/presentation/views/login_view.dart';
import 'package:social_media_app/features/home/presentation/views/home_view.dart';

SharedPreferences? prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  Bloc.observer = SimpleBlocObserver();
  setupServiceLocator();
  runApp(BlocProvider(
    create: (context) => AuthentcationCubit(getIt.get<AuthRepoImpl>()),
    child: const SocialMediaApp(),
  ));
}

class SocialMediaApp extends StatelessWidget {
  const SocialMediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    AuthentcationCubit c = AuthentcationCubit.get(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: c.getToken() == '' ? LoginView() : const HomeView(),
    );
  }
}
// create: (context) => AuthentcationCubit(getIt.get<AuthRepoImpl>()),
