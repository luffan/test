import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/theme_extensions.dart';

class AppTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;
  final bool Function(String?) validator;

  AppTextField({
    this.hintText,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: theme.textFieldBackgroundColor,
      child: TextFormField(
        controller: controller,
        validator: (text) => validator(text) ? null : 'Invalid $hintText',
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            color: theme.hintTextColor,
          ),
        ),
      ),
    );
  }
}
