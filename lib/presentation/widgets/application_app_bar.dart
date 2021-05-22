import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:profile/presentation/constants/dimens.dart';
import 'package:profile/presentation/constants/styles.dart';

import '../theme/theme_extensions.dart';

class ApplicationAppBar extends StatelessWidget {
  final Widget? leading;
  final String title;
  final List<Widget>? actions;

  ApplicationAppBar({
    required this.title,
    this.leading,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.defaultHorizontalMargin),
      child: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          title,
          style: AppTextStyle.primaryBoldText(theme),
        ),
        leading: leading,
        actions: actions,
      ),
    );
  }
}
