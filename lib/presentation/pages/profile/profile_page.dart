import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile/presentation/constants/colors.dart';
import 'package:profile/presentation/constants/dimens.dart';
import 'package:profile/presentation/constants/font.dart';
import 'package:profile/presentation/constants/strings.dart';
import 'package:profile/presentation/constants/styles.dart';
import 'package:profile/presentation/widgets/app_button.dart';
import 'package:profile/presentation/widgets/application_app_bar.dart';
import '../../theme/theme_extensions.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
              onPressed: Get.back,
            ),
            title: '',
            actions: [Icon(Icons.menu, color: theme.primaryTextColor)],
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                _mainProfileData(),
                _address(),
                _editLabel(),
                _clickButtons(),
                SizedBox(height: 50),
                _additionalData(),
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
          'Edit',
          style: TextStyle(
            color: theme.accentColor,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.w900,
            fontSize: FontSize.fontSizeM,
          ),
        ),
      ),
    );
  }

  Widget _mainProfileData() {
    return Column(
      children: <Widget>[
        ClipOval(
          child: Image.asset('assets/images/avatar.png', height: 114),
        ),
        SizedBox(height: 22),
        Text(
          Get.parameters['user'] ?? 'username',
          style: TextStyle(
            color: theme.primaryTextColor,
            fontSize: FontSize.fontSizeXL,
            fontWeight: FontWeight.w500,
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
            'New York',
            style: TextStyle(
              color: theme.secondaryTextColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.defaultVerticalMargin),
            child: Icon(
              Icons.circle,
              size: 6,
              color: const Color(0xFFB5C3C7),
            ),
          ),
          Text(
            'ID: 1120611',
            style: TextStyle(
              color: theme.secondaryTextColor,
              fontWeight: FontWeight.w500,
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
                child: Text(Strings.aboutMe),
              ),
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: AppButton.filledText(
              onClick: () {},
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
          width: 2,
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
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  content,
                  style:
                      AppTextStyle.primaryBoldText(theme).copyWith(color: theme.onButtonTextColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _additionalData() {
    return Container(
      color: theme.primaryTextColor,
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: _card(
              leading: Icons.phone,
              title: Strings.phoneNumber,
              content: '+375292756392',
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: _card(
              leading: Icons.mail,
              title: Strings.email,
              content: 'mihalkovgleb@gmail.com',
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: _card(
              leading: Icons.circle,
              title: Strings.completedProjects,
              content: '10',
            ),
          ),
        ],
      ),
    );
  }
}
