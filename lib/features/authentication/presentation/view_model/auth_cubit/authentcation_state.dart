


import 'package:social_media_app/features/authentication/data/models/register/register.dart';

abstract class AuthentcationState {}

 class AuthentcationInitial extends AuthentcationState {}
 class AuthentcationLoading extends AuthentcationState {}
 class AuthentcationSuccess extends AuthentcationState {
  final RegisterModel registerModel;
  AuthentcationSuccess({required this.registerModel});
 }
 class AuthentcationError extends AuthentcationState {
  final String message;
  AuthentcationError({required this.message});
 }
 class PasswordHideen extends AuthentcationState {}
