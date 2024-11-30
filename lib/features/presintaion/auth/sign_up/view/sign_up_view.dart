import 'package:chit_chat/features/presintaion/auth/sign_up/view/widgets/sign_up_body.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(child: SafeArea(child: SignUpBody())));
  }
}
