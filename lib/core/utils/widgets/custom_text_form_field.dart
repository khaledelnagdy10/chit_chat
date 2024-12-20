import 'package:chit_chat/constans.dart';
import 'package:chit_chat/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.onChanged,
    required this.text, required this.icon,
  });
  final String text;
  final void Function(String value) onChanged;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'please enter Data';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: text,
          labelStyle: Style.textStyle18,
          
          prefixIcon:  icon,
          prefixIconColor: kPrimaryColor,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor)),
        ),
      ),
    );
  }
}
