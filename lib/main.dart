import 'package:chit_chat/features/presintaion/auth/sign_up/view/sign_up_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: SignUpView());
  }
}
