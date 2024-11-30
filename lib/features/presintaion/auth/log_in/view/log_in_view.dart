import 'package:chit_chat/features/presintaion/auth/log_in/view/widgets/log_in_body.dart';
import 'package:chit_chat/features/presintaion/auth/sign_up/view/widgets/sign_up_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(child: SafeArea(child: LoginBody())));
  }
}
