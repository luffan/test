import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:profile/data/preference_repository.dart';
import 'package:profile/presentation/pages/profile/profile_controller.dart';

class SignInController extends GetxController {
  PreferenceRepository _preference;

  final usernameTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  SignInController(this._preference);

  void signIn() async {
    final errorMessage = await _checkFields();
    if (errorMessage.isEmpty) {
      Get.find<ProfileController>().loadedEmail();
      Get.offNamed('/profile');
    } else {
      Get.defaultDialog(
        title: "Error",
        middleText: errorMessage,
      );
      _clearFields();
    }
  }

  void goToSignUp() => Get.toNamed('/signUp');

  bool _validateUsername(String username) {
    return username.isNotEmpty;
  }

  Future<bool> _validatePassword(String password) async {
    if (password.isEmpty) {
      return false;
    }

    final prefPassword = await _preference.getPassword();

    return prefPassword == password;
  }

  Future<String> _checkFields() async {
    var errorMessage = '';
    final isCorrectUsername = _validateUsername(usernameTextEditingController.text);
    final isCorrectPassword = await _validatePassword(passwordTextEditingController.text);
    if (!isCorrectUsername) errorMessage += 'There is no such user name.\n';
    if (!isCorrectPassword) errorMessage += 'Invalid password.\n';
    return errorMessage;
  }

  void _clearFields() {
    usernameTextEditingController.text = '';
    passwordTextEditingController.text = '';
  }

  @override
  void dispose() {
    usernameTextEditingController.dispose();
    passwordTextEditingController.dispose();
    super.dispose();
  }
}
