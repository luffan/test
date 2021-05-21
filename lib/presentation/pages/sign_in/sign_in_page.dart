import 'package:flutter/cupertino.dart';
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
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: Dimens.defaultHorizontalMargin),
                  child: Image.asset('assets/images/sign_in.png', height: 150),
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
                AppButton.filledText(onClick: controller.signIn, text: Strings.signIn),
                _verticalSpace(),
                Center(child: Text(Strings.or, style: AppTextStyle.primaryBoldText(theme))),
                _verticalSpace(),
                _socialNetworks(),
                SizedBox(height: 50.0),
                _signUp(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialNetworks() {
    return Row(
      children: [
        _socialNetworkButton(onClick: () {}, asset: 'assets/images/facebook.png'),
        SizedBox(width: 8),
        _socialNetworkButton(onClick: () {}, asset: 'assets/images/twitter.png'),
        SizedBox(width: 8),
        _socialNetworkButton(onClick: () {}, asset: 'assets/images/linked_in.png'),
      ],
    );
  }

  Widget _socialNetworkButton({required void Function() onClick, required String asset}) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: theme.borderColor)),
        child: AppButton(
          onClick: onClick,
          child: Image.asset(asset, height: 20),
        ),
      ),
    );
  }

  Widget _signUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Strings.dontHaveAccount,
          style: TextStyle(color: theme.primaryTextColor, fontSize: FontSize.fontSizeM),
        ),
        SizedBox(width: 4),
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
    );
  }

  Widget _verticalSpace() => SizedBox(height: Dimens.defaultVerticalMargin);
}
