import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile/di/app_binding.dart';

import 'presentation/pages/sign_in/sign_in_page.dart';
import 'presentation/pages/sign_up/sign_up_page.dart';

void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBinding(),
      getPages: _pages,
      initialRoute: '/signIn',
    );
  }

  List<GetPage> get _pages => [
        GetPage(name: '/signIn', page: () => SignInPage()),
        GetPage(name: '/signUp', page: () => SignUpPage()),
      ];
}
