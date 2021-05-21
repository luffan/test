import 'package:flutter/cupertino.dart';
import 'package:profile/presentation/constants/font.dart';
import 'package:profile/presentation/theme/app_theme.dart';

abstract class AppTextStyle {
  static TextStyle primaryBoldText(AppTheme theme) => TextStyle(
    fontSize: FontSize.fontSizeM,
    color: theme.primaryTextColor,
    fontWeight: FontWeight.w900,
  );
}