import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:profile/presentation/constants/dimens.dart';
import 'package:profile/presentation/constants/font.dart';
import 'package:profile/presentation/constants/strings.dart';
import 'package:profile/presentation/constants/styles.dart';
import 'package:profile/presentation/pages/sign_in/sign_in_controller.dart';
import 'package:profile/presentation/widgets/application_app_bar.dart';
import 'package:profile/presentation/widgets/app_button.dart';
import 'package:profile/presentation/widgets/app_text_field.dart';

import '../../theme/theme_extensions.dart';

class SignUpPage extends GetView<SignInController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Dimens.defaultContentPadding),
        child: Column(
          children: [
            ApplicationAppBar(
              title: Strings.signIn,
              actions: [Icon(Icons.menu, color: theme.primaryTextColor)],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Image.asset('assets/images/sign_in.png'),
              ),
            ),
            AppTextField(hintText: Strings.username),
            _verticalSpace(),
            AppTextField(hintText: Strings.password),
            _verticalSpace(),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () => Get.defaultDialog(
                  title: Strings.forgotPassword,
                  middleText: '',
                ),
                child: Text(
                  Strings.forgotPassword,
                  style: AppTextStyle.primaryBoldText(theme),
                ),
              ),
            ),
            SizedBox(height: 50.0),
            AppButton(onClick: controller.signIn),
            _verticalSpace(),
            Text(Strings.or, style: AppTextStyle.primaryBoldText(theme)),
            SizedBox(height: 50.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Strings.dontHaveAccount,
                  style: TextStyle(color: theme.primaryTextColor, fontSize: FontSize.fontSizeM),
                ),
                SizedBox(width: 6),
                GestureDetector(
                  onTap: controller.goToSignUp,
                  child: Text(
                    Strings.signUp,
                    style: TextStyle(
                      color: theme.accentColor,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w900,
                      fontSize: FontSize.fontSizeM,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _verticalSpace() => SizedBox(height: Dimens.defaultVerticalMargin);
}
