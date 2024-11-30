import 'dart:developer';

import 'package:chit_chat/constans.dart';
import 'package:chit_chat/core/utils/logo.dart';
import 'package:chit_chat/core/utils/text_styles.dart';
import 'package:chit_chat/core/utils/widgets/custom_button.dart';
import 'package:chit_chat/core/utils/widgets/custom_text_form_field.dart';
import 'package:chit_chat/features/presintaion/auth/log_in/view/log_in_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final GlobalKey<FormState> key = GlobalKey();
  String emailAddress = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
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
            text: 'email',
            onChanged: (String value) {
              setState(() {
                emailAddress = value;
                log(emailAddress);
              });
            },
          ),
          CustomTextFormField(
            text: 'password',
            onChanged: (String value) {
              password = value;
              log(password);
            },
          ),
          SizedBox(
            width: 370,
            child: CustomButton(
              text: 'SignUp',
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  try {
                    UserCredential credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: emailAddress,
                      password: password,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Sucssesfull')));
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('The password provided is too weak.')));
                    } else if (e.code == 'email-already-in-use') {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                              'The account already exists for that email')));
                    }
                  } catch (e) {
                    print(e);
                  }
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
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
  }
}
