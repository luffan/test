import 'package:get/get.dart';
import 'package:profile/date/preference_repository.dart';

class SignUpController extends GetxController {
  PreferenceRepository _preference;


  SignUpController(this._preference);

  void signIn() {

  }

  void goToSignIn() => Get.toNamed('/signIn');
}
