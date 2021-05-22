import 'package:get/get.dart';
import 'package:profile/data/preference_repository.dart';
import 'package:profile/presentation/pages/profile/profile_controller.dart';
import 'package:profile/presentation/pages/sign_in/sign_in_controller.dart';
import 'package:profile/presentation/pages/sign_up/sign_up_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    // Repositories
    Get.put<PreferenceRepository>(PreferenceRepository());

    // Controllers
    Get.put<SignInController>(SignInController(Get.find<PreferenceRepository>()));
    Get.put<SignUpController>(SignUpController(Get.find<PreferenceRepository>()));
    Get.put<ProfileController>(ProfileController(Get.find<PreferenceRepository>()));
  }
}
