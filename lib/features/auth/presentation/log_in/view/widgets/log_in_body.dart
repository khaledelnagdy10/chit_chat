import 'dart:developer';

import 'package:chit_chat/constans.dart';
import 'package:chit_chat/core/utils/logo.dart';
import 'package:chit_chat/core/utils/text_styles.dart';
import 'package:chit_chat/core/utils/widgets/custom_button.dart';
import 'package:chit_chat/core/utils/widgets/custom_text_form_field.dart';
import 'package:chit_chat/features/auth/data/manager/log_in/log_in_cubit.dart';
import 'package:chit_chat/features/auth/data/services/auth_services/auth_services.dart';
import 'package:chit_chat/features/auth/presentation/sign_up/view/sign_up_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBody extends StatelessWidget {
  LoginBody({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();
  String emailAddress = '';
  String password = '';
  String userId = FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogInCubit, LogInState>(
      
      builder: (context, state) {
        if (state is LogInLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is LogInFaliure) {
          return const Center(child: Text('there was an error'),);
        }
        return Form(
          key: formKey,
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Groupie',
                    style: Style.textStyleBold35,
                  ),
                ],
              ),
              Text(
                'Login now to see what they are talking!',
                style: Style.textStyle18.copyWith(color: Colors.grey[700]),
              ),
              const Logo(),
              CustomTextFormField(
                text: 'Email',
                onChanged: (String value) {
                  emailAddress = value;
                  log(emailAddress);
                },
                icon: const Icon(Icons.email),
              ),
              CustomTextFormField(
                text: 'password',
                onChanged: (String value) {
                  password = value;
                  log(password);
                },
                icon: const Icon(Icons.lock),
              ),
              SizedBox(
                width: 370,
                child: CustomButton(
                  text: 'LogIn',
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      AuthServices().signInWithEmailAndPassword(
                          context, emailAddress, password);
                      log(userId);
                    }
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'I already have an account\t ',
                  ),
                  GestureDetector(
                    onTap: () async {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const SignUpView();
                      }));
                    },
                    child: Text(
                      'SignUp ',
                      style: Style.textStyle18.copyWith(color: kPrimaryColor),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
