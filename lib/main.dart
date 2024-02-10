import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media_app/constants.dart';
import 'package:social_media_app/core/utils/app_router.dart';
import 'package:social_media_app/core/utils/bloc_observer.dart';
import 'package:social_media_app/core/utils/services_locator.dart';
import 'package:social_media_app/features/home/presentation/view_model/home_cubit/home_cubit.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  isSignedUp = prefs.getBool('isSignedUp');
  Bloc.observer = SimpleBlocObserver();
  setupServiceLocator();
  runApp(const SocialMediaApp());
}

class SocialMediaApp extends StatelessWidget {
  const SocialMediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        title: kAppTitle,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
