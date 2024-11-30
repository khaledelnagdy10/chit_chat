import 'package:chit_chat/constans.dart';
import 'package:chit_chat/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return 
    AppBar(
      backgroundColor: kPrimaryColor,
      leading: IconButton(onPressed: (){},
     icon: const Icon( Icons.menu),color: Colors.white,),
     title: Center(child: Text('Groups',style: Style.textStyleBold24.copyWith(color: Colors.white),)),
    actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.search),color: Colors.white,)],
     )
    ;
  }
}