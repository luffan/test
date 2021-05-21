import 'package:flutter/material.dart';
import 'package:profile/presentation/constants/font.dart';

import '../theme/theme_extensions.dart';

class NavigateLabel extends StatelessWidget {
  final String content;
  final Function() navigate;
  final String navigateText;

  const NavigateLabel({
    Key? key,
    required this.content,
    required this.navigate,
    required this.navigateText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          content,
          style: TextStyle(color: theme.primaryTextColor, fontSize: FontSize.fontSizeM),
        ),
        SizedBox(width: 4),
        GestureDetector(
          onTap: navigate,
          child: Text(
            navigateText,
            style: TextStyle(
              color: theme.accentColor,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w900,
              fontSize: FontSize.fontSizeM,
            ),
          ),
        ),
      ],
    );
  }
}
