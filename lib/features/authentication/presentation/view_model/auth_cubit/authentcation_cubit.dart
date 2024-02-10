// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/features/authentication/data/repos/auth_repo.dart';
import 'package:social_media_app/features/authentication/presentation/view_model/auth_cubit/authentcation_state.dart';

class AuthentcationCubit extends Cubit<AuthentcationState> {
  AuthentcationCubit(this.authRepo) : super(AuthentcationInitial());

  static AuthentcationCubit get(context) => BlocProvider.of(context);
  final AuthRepo authRepo;
  bool isHidden = true;

  void hidePassword() {
    isHidden = !isHidden;
    emit(PasswordHideen());
  }

  Future<void> register({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final result = await authRepo.register(
        username: username,
        email: email,
        password: password,
      );

      print(result);

      result.fold(
        (failure) => emit(AuthentcationError(message: failure.errMessage)),
        (registerModel) =>
            emit(AuthentcationSuccess(registerModel: registerModel)),
      );
    } catch (e) {
      // Handle exceptions here if needed
      print(e);
    }
  }
}