import 'package:chit_chat/core/utils/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(height: 80,
      child: CustomAppBar(text: 'Profile', leadingIcon: const Icon(Icons.menu), 
      actionIcon: const Icon(Icons.search), leadingIconOnPressed: (){}, actionIconOnPressed: (){}),
    )
     ;
  }
}