import 'package:get/get.dart';
import 'package:profile/data/preference_repository.dart';
import 'package:profile/presentation/pages/sign_in/sign_in_controller.dart';

class ProfileController extends GetxController {
  PreferenceRepository _preference;
  var email = ''.obs;

  ProfileController(this._preference);

  void logOut() => Get.offNamed('/signIn');

  String get username => Get.find<SignInController>().usernameTextEditingController.text;

  void loadedEmail() async {
    email.value = await _preference.getEmail();
    print(email.value);
  }
}
