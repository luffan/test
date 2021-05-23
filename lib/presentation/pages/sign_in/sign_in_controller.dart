import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:profile/data/preference_repository.dart';
import 'package:profile/presentation/pages/profile/profile_controller.dart';

class SignInController extends GetxController {
  PreferenceRepository _preference;

  final usernameTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  var isValidPass = true.obs;

  SignInController(this._preference);

  GlobalKey<FormState> get formKey => _formKey;

  void signIn() async {
    if (_formKey.currentState!.validate() &&
        (await validatePassword(passwordTextEditingController.text))) {
      Get.find<ProfileController>().loadedEmail();
      Get.offNamed('/profile');
    }
  }

  void goToSignUp() => Get.toNamed('/signUp');

  bool validateUsername(String? username) {
    return username != null && username.isNotEmpty;
  }

  Future<bool> validatePassword(String? password) async {
    if (password == null || password.isEmpty) {
      isValidPass.value = false;
      return isValidPass.value;
    }
    isValidPass.value = (await _preference.getPassword()) == password;

    return isValidPass.value;
  }

  @override
  void dispose() {
    usernameTextEditingController.dispose();
    passwordTextEditingController.dispose();
    super.dispose();
  }
}
