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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  token = prefs.getString('token') ?? '';
  Bloc.observer = SimpleBlocObserver();
  setupServiceLocator();
  runApp(const SocialMediaApp());
}

class SocialMediaApp extends StatelessWidget {
  const SocialMediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthentcationCubit(getIt.get<AuthRepoImpl>()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: kAppTitle,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: token == '' ? LoginView() : const HomeView(),
      ),
    );
  }
}
