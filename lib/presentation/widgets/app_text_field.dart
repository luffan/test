import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/theme_extensions.dart';

class AppTextField extends StatelessWidget {

  final String? hintText;

  AppTextField({
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: theme.textFieldBackgroundColor,
      child: TextField(
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
