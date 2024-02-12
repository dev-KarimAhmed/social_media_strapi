import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/core/navigationfunctions.dart';
import 'package:social_media_app/features/authentication/presentation/view_model/auth_cubit/authentcation_cubit.dart';
import 'package:social_media_app/features/authentication/presentation/view_model/auth_cubit/authentcation_state.dart';
import 'package:social_media_app/features/authentication/presentation/views/widgets/custom_text_button.dart';
import 'package:social_media_app/features/home/presentation/views/home_view.dart';

import '../../../../core/custom_text_field.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthentcationCubit, AuthentcationState>(
      listener: (context, state) async {
        AuthentcationCubit cubit = AuthentcationCubit.get(context);
        if (state is AuthentcationSuccess) {
          print('======================> ${state.authModel.user?.username}');
          cubit
              .saveToken(state.authModel.jwt ?? '')
              .then((value) => navigateWithoutBack(context, const HomeView()));
        } else if (state is AuthentcationError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        var cubit = AuthentcationCubit.get(context);

        return Scaffold(
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 150,
                    ),
                    const Text(
                      'REGISTER',
                      style: TextStyle(
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Register Now to find more friends',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      hintText: 'User Name',
                      prefixIcon: const Icon(Icons.person),
                      controller: name,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      hintText: 'Email Address',
                      prefixIcon: const Icon(Icons.email),
                      keyboardType: TextInputType.emailAddress,
                      controller: email,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      controller: password,
                      suffixIcon: IconButton(
                        onPressed: () {
                          cubit.hidePassword();
                        },
                        icon: cubit.isHidden
                            ? const Icon(Icons.remove_red_eye)
                            : const Icon(Icons.visibility_off),
                      ),
                      obscureText: cubit.isHidden,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      hintText: 'Phone',
                      prefixIcon: const Icon(Icons.phone),
                      keyboardType: TextInputType.phone,
                      controller: phone,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          print('=====================');
                          cubit.register(
                            username: name.text,
                            email: email.text,
                            password: password.text,
                          );
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.blue,
                        ),
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Do you have an account?',
                          style: TextStyle(fontSize: 16),
                        ),
                        CustomTextButton(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          text: 'Login',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
        );
      },
    );
  }
}
