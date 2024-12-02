import 'package:chit_chat/constans.dart';
import 'package:chit_chat/features/home/presentation/view/widgets/home_body.dart';
import 'package:chit_chat/features/home/presentation/view/widgets/home_drawer.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return 
     Scaffold(
      drawer:  const NavBar(),
      body: 
     const HomeBody(),
     
    floatingActionButton: Container(
      decoration: const BoxDecoration(shape: BoxShape.circle,color: kPrimaryColor) ,
      child: IconButton(onPressed: (){}, icon: const Icon(Icons.add))),
    );
  }
}