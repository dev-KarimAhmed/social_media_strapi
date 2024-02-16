import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_media_app/features/authentication/data/models/register/register.dart';

abstract class AuthentcationState {}

class AuthentcationInitial extends AuthentcationState {}

class AuthentcationLoading extends AuthentcationState {}

class AuthentcationSuccess extends AuthentcationState {
  final AuthModel authModel;
  AuthentcationSuccess({required this.authModel});
}

class AuthentcationError extends AuthentcationState {
  final String message;
  AuthentcationError({required this.message});
}

class PasswordHideen extends AuthentcationState {}

class LoginSuccess extends AuthentcationState {
  final AuthModel authModel;
  LoginSuccess({required this.authModel});
}

class LoginError extends AuthentcationState {
  final String message;
  LoginError({required this.message});
}

class LoginLoading extends AuthentcationState {}

class TokenSavedSuccess extends AuthentcationState {}

class SignedOutSuccess extends AuthentcationState {}

class AuthenticationWithGoogleSuccess extends AuthentcationState {
  final GoogleSignInAccount? googleUser;

  AuthenticationWithGoogleSuccess(this.googleUser);
}

class AuthenticationWithGoogleError extends AuthentcationState {
  final String errMessage;

  AuthenticationWithGoogleError(this.errMessage);
}
