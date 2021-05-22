import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile/presentation/constants/colors.dart';
import 'package:profile/presentation/constants/dimens.dart';
import 'package:profile/presentation/constants/font.dart';
import 'package:profile/presentation/constants/strings.dart';
import 'package:profile/presentation/constants/styles.dart';
import 'package:profile/presentation/pages/profile/profile_controller.dart';
import 'package:profile/presentation/pages/utils/support_function.dart';
import 'package:profile/presentation/widgets/app_button.dart';
import 'package:profile/presentation/widgets/application_app_bar.dart';
import '../../theme/theme_extensions.dart';

class ProfilePage extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ApplicationAppBar(
            leading: IconButton(
              icon: Icon(
                Icons.chevron_left,
                color: theme.primaryTextColor,
              ),
              onPressed: controller.logOut,
            ),
            title: '',
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
              children: <Widget>[
                _mainProfileData(),
                _address(),
                _editLabel(),
                _clickButtons(),
                largeVerticalSpace(),
                _additionalProfileData(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _editLabel() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 17, bottom: 24),
        child: Text(
          Strings.edit,
          style: AppTextStyle.primaryBoldText(theme).copyWith(
            color: theme.accentColor,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  Widget _mainProfileData() {
    return Column(
      children: <Widget>[
        ClipOval(
          child: Image.asset(
            'assets/images/avatar.png',
            height: 114,
          ),
        ),
        SizedBox(height: 22),
        Text(
          controller.username,
          style: AppTextStyle.primaryText(theme).copyWith(
            fontSize: FontSize.fontSizeXL,
          ),
        ),
      ],
    );
  }

  Widget _address() {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            Strings.exampleCity,
            style: AppTextStyle.primaryText(theme).copyWith(
              color: theme.secondaryTextColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.defaultVerticalMargin),
            child: Icon(
              Icons.circle,
              size: 6,
              color: colorDividerCircle,
            ),
          ),
          Text(
            Strings.exampleID,
            style: AppTextStyle.primaryText(theme).copyWith(
              color: theme.secondaryTextColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _clickButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.defaultContentPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: OutlinedButton(
              onPressed: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 22),
                child: Text(
                  Strings.aboutMe,
                  style: AppTextStyle.primaryBoldText(theme).copyWith(
                    color: theme.secondaryTextColor,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: AppButton.filledText(
              onClick: controller.logOut,
              text: Strings.logOut,
            ),
          )
        ],
      ),
    );
  }

  Widget _card({
    required IconData leading,
    required String title,
    required String content,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: theme.secondaryTextColor,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 27, vertical: 20),
        child: Row(
          children: <Widget>[
            Icon(
              leading,
              color: theme.accentColor,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              height: 22,
              child: VerticalDivider(
                width: 1,
                color: theme.secondaryTextColor,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: AppTextStyle.primaryText(theme).copyWith(
                    color: colorCardTitleText,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  content,
                  style: AppTextStyle.primaryBoldText(theme).copyWith(
                    color: theme.onButtonTextColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _additionalProfileData() {
    return Container(
      color: theme.primaryTextColor,
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.defaultContentPadding),
            child: _card(
              leading: Icons.phone,
              title: Strings.phoneNumber,
              content: Strings.examplePhoneNumber,
            ),
          ),
          defaultVerticalSpace(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.defaultContentPadding),
            child: Obx(
              () => _card(
                leading: Icons.mail,
                title: Strings.email,
                content: controller.email.value,
              ),
            ),
          ),
          defaultVerticalSpace(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.defaultContentPadding),
            child: _card(
              leading: Icons.circle,
              title: Strings.completedProjects,
              content: Strings.exampleCountCompletedProject,
            ),
          ),
        ],
      ),
    );
  }
}
