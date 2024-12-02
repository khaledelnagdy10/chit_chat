import 'package:chit_chat/core/utils/widgets/custom_app_bar.dart';
import 'package:chit_chat/features/profile/presentation/view/profile_view.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 80,
      child:   
   
    CustomAppBar(text: 'Group',  actionIcon: Icon(Icons.search))
      

      ,)
    
    
    ;
  }
}