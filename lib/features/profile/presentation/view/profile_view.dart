import 'package:chit_chat/core/utils/widgets/drawer.dart';
import 'package:chit_chat/features/profile/presentation/view/widgets/profile_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: NavBar(),
      body: ProfileBody(),
    );
  }
}