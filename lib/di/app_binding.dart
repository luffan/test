import 'package:get/get.dart';
import 'package:profile/presentation/pages/sign_in/sign_in_controller.dart';
import 'package:profile/presentation/pages/sign_up/sign_up_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SignInController>(SignInController());
    Get.put<SignUpController>(SignUpController());
  }
}
