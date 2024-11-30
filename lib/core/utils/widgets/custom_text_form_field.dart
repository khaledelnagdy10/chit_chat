import 'package:chit_chat/constans.dart';
import 'package:chit_chat/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.onChanged,
    required this.text,
  });
  final String text;
  final void Function(String value) onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'please enter DATA';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: text,
          labelStyle: Style.textStyle18,
          prefixIcon: const Icon(Icons.email),
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