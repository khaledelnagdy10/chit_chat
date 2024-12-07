import 'package:chit_chat/features/home/presentation/view/widgets/custom_floating_action_botton.dart';
import 'package:chit_chat/features/home/presentation/view/widgets/home_body.dart';
import 'package:chit_chat/core/utils/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return 
     const Scaffold(
      drawer:  NavBar(),
      body: 
     HomeBody(),
     
    floatingActionButton: CustomFloatingActionButton()
    );
  }
}