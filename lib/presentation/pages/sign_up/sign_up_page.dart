import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:profile/presentation/constants/dimens.dart';
import 'package:profile/presentation/constants/strings.dart';
import 'package:profile/presentation/constants/styles.dart';
import 'package:profile/presentation/pages/sign_up/sign_up_controller.dart';
import 'package:profile/presentation/pages/utils/support_function.dart';
import 'package:profile/presentation/widgets/app_button.dart';
import 'package:profile/presentation/widgets/application_app_bar.dart';
import 'package:profile/presentation/widgets/app_text_field.dart';
import 'package:profile/presentation/widgets/navigate_label.dart';
import 'package:profile/presentation/widgets/social_network.dart';

import '../../theme/theme_extensions.dart';

class SignUpPage extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ApplicationAppBar(
            leading: IconButton(
              icon: Icon(
                Icons.chevron_left,
                color: theme.primaryTextColor,
              ),
              onPressed: Get.back,
            ),
            title: Strings.signUp,
            actions: [
              Icon(
                Icons.menu,
                color: theme.primaryTextColor,
              )
            ],
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(Dimens.defaultContentPadding),
              children: <Widget>[
                Image.asset('assets/images/sign_up.png', height: 141),
                largeVerticalSpace(),
                AppTextField(
                  hintText: Strings.enterEmail,
                  controller: controller.emailTextEditingController,
                ),
                defaultVerticalSpace(),
                AppTextField(
                  hintText: Strings.enterPassword,
                  controller: controller.passwordTextEditingController,
                ),
                defaultVerticalSpace(),
                AppTextField(
                  hintText: Strings.confirmPassword,
                  controller: controller.confirmPasswordTextEditingController,
                ),
                defaultVerticalSpace(),
                AppButton.filledText(
                  onClick: controller.signUp,
                  text: Strings.login,
                ),
                defaultVerticalSpace(),
                Center(
                  child: Text(
                    Strings.or,
                    style: AppTextStyle.primaryBoldText(theme),
                  ),
                ),
                defaultVerticalSpace(),
                SocialNetwork(),
                largeVerticalSpace(),
                NavigateLabel(
                  content: Strings.alreadyHaveAccount,
                  navigate: controller.goToSignIn,
                  navigateText: Strings.signIn,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
