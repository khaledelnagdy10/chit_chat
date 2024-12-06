import 'dart:developer';

import 'package:chit_chat/constans.dart';
import 'package:chit_chat/core/utils/logo.dart';
import 'package:chit_chat/core/utils/text_styles.dart';
import 'package:chit_chat/core/utils/widgets/custom_button.dart';
import 'package:chit_chat/core/utils/widgets/custom_text_form_field.dart';
import 'package:chit_chat/features/auth/data/manager/sign_up/sign_up_cubit.dart';
import 'package:chit_chat/features/auth/presentation/log_in/view/log_in_view.dart';
import 'package:chit_chat/features/auth/data/services/auth_services/auth_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBody extends StatelessWidget {
  SignUpBody({super.key});
  final GlobalKey<FormState> formKey = GlobalKey();
  String emailAddress = '';
  String password = '';
  String fullName = '';
  CollectionReference db = FirebaseFirestore.instance.collection('user');
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        if (state is SignUpFaliure) {
          return const Center(child: Text('opps there was an error'),);
        }
         if (state is SignUpLoading) {
          return const Center(child: CircularProgressIndicator(),);
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
                onChanged: (String value) {
                 
                    fullName = value;
                  
                },
                text: 'Full name',
                icon: const Icon(Icons.person),
              ),
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
                  text: 'SignUp',
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      AuthServices().createUserWithEmailAndPassword(
                          context, fullName, emailAddress, password);
                      db.add({'email': emailAddress, 'full name': fullName});
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
                        return const LoginView();
                      }));
                    },
                    child: Text(
                      'LogIn ',
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
