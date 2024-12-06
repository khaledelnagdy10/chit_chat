import 'package:chit_chat/features/auth/data/manager/log_in/log_in_cubit.dart';
import 'package:chit_chat/features/auth/data/manager/sign_up/sign_up_cubit.dart';
import 'package:chit_chat/features/auth/presentation/sign_up/view/sign_up_view.dart';
import 'package:chit_chat/features/home/presentation/view/home_view.dart';
import 'package:chit_chat/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      
      providers: [
        BlocProvider(create: (context)=>LogInCubit()),
         BlocProvider(create: (context)=>SignUpCubit())
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: SignUpView()),
    );
  }
}
