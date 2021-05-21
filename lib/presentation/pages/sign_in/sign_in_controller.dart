import 'package:get/get.dart';
import 'package:profile/date/preference_repository.dart';

class SignInController extends GetxController {
  PreferenceRepository _preference;

  SignInController(this._preference);

  void signIn() {
  }

  void goToSignUp() => Get.toNamed('/signUp');
}
