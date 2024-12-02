import 'package:chit_chat/constans.dart';
import 'package:chit_chat/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.text, required this.actionIcon, });
final String text;


final Icon actionIcon;
  @override
  Widget build(BuildContext context) {
    return 
    AppBar(
      backgroundColor: kPrimaryColor,
     
     title: Center(child: Text(text,style: Style.textStyleBold24.copyWith(color: Colors.white),)),
    actions: [IconButton(onPressed:(){} , icon: actionIcon,)],
     )
    ;
  }
}