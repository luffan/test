import 'package:flutter/material.dart';

import 'app_button.dart';
import '../theme/theme_extensions.dart';

class SocialNetwork extends StatelessWidget {
  const SocialNetwork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
