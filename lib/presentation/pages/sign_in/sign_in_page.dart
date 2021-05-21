import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:profile/presentation/constants/dimens.dart';
import 'package:profile/presentation/constants/strings.dart';
import 'package:profile/presentation/constants/styles.dart';
import 'package:profile/presentation/pages/sign_in/sign_in_controller.dart';
import 'package:profile/presentation/widgets/application_app_bar.dart';
import 'package:profile/presentation/widgets/app_button.dart';
import 'package:profile/presentation/widgets/app_text_field.dart';
import 'package:profile/presentation/widgets/navigate_label.dart';
import 'package:profile/presentation/widgets/social_network.dart';

import '../../theme/theme_extensions.dart';

class SignInPage extends GetView<SignInController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ApplicationAppBar(
            title: Strings.signIn,
            actions: [Icon(Icons.menu, color: theme.primaryTextColor)],
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(Dimens.defaultContentPadding),
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: Dimens.defaultHorizontalMargin),
                  child: Image.asset('assets/images/sign_in.png', height: 150),
                ),
                AppTextField(
                  hintText: Strings.username,
                  validator: (username) {
                    if (username == null || username.isEmpty) {
                      return null;
                    }
                  },
                ),
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
                AppButton.filledText(onClick: controller.signIn, text: Strings.signIn),
                _verticalSpace(),
                Center(child: Text(Strings.or, style: AppTextStyle.primaryBoldText(theme))),
                _verticalSpace(),
                SocialNetwork(),
                SizedBox(height: 50.0),
                NavigateLabel(
                  content: Strings.dontHaveAccount,
                  navigate: controller.goToSignUp,
                  navigateText: Strings.signUp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _verticalSpace() => SizedBox(height: Dimens.defaultVerticalMargin);
}
