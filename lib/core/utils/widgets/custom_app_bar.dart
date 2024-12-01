import 'package:chit_chat/constans.dart';
import 'package:chit_chat/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.text,  required this.leadingIcon, required this.actionIcon, required this.leadingIconOnPressed, required this.actionIconOnPressed});
final String text;
final void Function() leadingIconOnPressed;
final void Function() actionIconOnPressed;
final Icon leadingIcon;
final Icon actionIcon;
  @override
  Widget build(BuildContext context) {
    return 
    AppBar(
      backgroundColor: kPrimaryColor,
      leading: IconButton(onPressed: leadingIconOnPressed,
     icon: leadingIcon),
     title: Center(child: Text(text,style: Style.textStyleBold24.copyWith(color: Colors.white),)),
    actions: [IconButton(onPressed:actionIconOnPressed , icon: actionIcon,)],
     )
    ;
  }
}