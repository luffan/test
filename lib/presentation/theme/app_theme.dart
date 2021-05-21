import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:profile/presentation/constants/colors.dart';

import '../constants/font.dart';

class AppTheme extends Equatable {
  final ThemeData materialTheme;

  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color buttonColor;
  final Color onButtonTextColor;
  final Color hintTextColor;
  final Color textFieldBackgroundColor;
  final Color accentColor;
  final Color borderColor;

  AppTheme({
    required this.materialTheme,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.buttonColor,
    required this.onButtonTextColor,
    required this.hintTextColor,
    required this.accentColor,
    required this.textFieldBackgroundColor,
    required this.borderColor,
  });

  @override
  List<Object> get props => [
        materialTheme,
        primaryTextColor,
        secondaryTextColor,
        buttonColor,
        onButtonTextColor,
        accentColor,
        textFieldBackgroundColor,
        borderColor,
      ];
}

final defaultTheme = AppTheme(
  materialTheme: ThemeData(fontFamily: fontFamilyMain),
  primaryTextColor: colorGrayDark,
  secondaryTextColor: colorGray,
  buttonColor: colorGreen,
  onButtonTextColor: Colors.white,
  accentColor: colorOrange,
  hintTextColor: colorGrayLight,
  textFieldBackgroundColor: colorLight,
  borderColor: colorBorder,
);
