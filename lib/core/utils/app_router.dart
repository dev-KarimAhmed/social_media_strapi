import 'package:go_router/go_router.dart';
import 'package:social_media_app/constants.dart';
import 'package:social_media_app/features/authentication/presentation/views/login_view.dart';
import 'package:social_media_app/features/authentication/presentation/views/register_view.dart';
import 'package:social_media_app/features/home/presentation/views/home_view.dart';

abstract class AppRouter {
  static const String kLoginView = '/login';
  static const String kRegisterView = '/register';
  static const String kHomeView = '/home';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          if (isSignedUp == false) {
            return LoginView();
          } else {
            return const HomeView();
          }
        },
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => RegisterView(),
      ),
    ],
  );
}
