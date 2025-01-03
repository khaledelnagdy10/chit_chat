import 'package:chit_chat/constans.dart';
import 'package:chit_chat/core/utils/text_styles.dart';
import 'package:chit_chat/features/home/presentation/view/home_view.dart';
import 'package:chit_chat/features/profile/presentation/view/profile_view.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key, });

  @override
  Widget build(BuildContext context) {
    return   Drawer(child: 
    Column(children: [
       Icon(Icons.account_circle,size: 150,color: Colors.grey[850],),
       const Text('Khaled elnagdy',style: Style.textStyle18,),
      const Divider(),
 ListTile(
  onTap: (){

     Navigator.push(context, MaterialPageRoute(builder: (context){
      return const HomeView();
    }));
  },
   contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 6),
  leading: const Icon(Icons.group,color: kPrimaryColor,),
  title: const Text('Group'),
),

 ListTile(
  onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return const ProfileView();
    }));
  },
   contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 6),
  leading: const Icon(Icons.account_circle),
  title: const Text('Profile'),
),

 ListTile(
  onTap: (){},
   contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 6),
  leading: const Icon(Icons.exit_to_app),
  title: const Text('Logout'),
),
   
    ],),);
  }
}