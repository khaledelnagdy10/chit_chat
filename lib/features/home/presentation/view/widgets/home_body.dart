import 'package:chit_chat/core/utils/widgets/custom_app_bar.dart';
import 'package:chit_chat/features/profile/presentation/view/profile_view.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child:   
      CustomAppBar(text: 'Group', leadingIcon: const Icon(Icons.menu), actionIcon: const Icon(Icons.search), 
      leadingIconOnPressed: (){
Navigator.push(context, MaterialPageRoute(builder: (context){

return const ProfileView();
}));

      }, actionIconOnPressed: (){})
      

      ,)
    
    
    ;
  }
}