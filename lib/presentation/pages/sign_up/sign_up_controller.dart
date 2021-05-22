import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile/data/preference_repository.dart';

class SignUpController extends GetxController {
  PreferenceRepository _preference;

  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final confirmPasswordTextEditingController = TextEditingController();

  SignUpController(this._preference);

  void signUp() {
    final errorMessage = checkFields();
    if (errorMessage.isEmpty) {
      _preference.saveEmail(emailTextEditingController.text);
      _preference.savePassword(passwordTextEditingController.text);
      Get.back();
    } else {
      Get.defaultDialog(
        title: "Error",
        middleText: errorMessage,
      );
      _clearFields();
    }
  }

  void goToSignIn() => Get.back();

  bool _validateField(String email) {
    return email.isEmpty;
  }

  String checkFields() {
    var errorMessage = '';
    if (_validateField(emailTextEditingController.text))
      errorMessage += 'There is no such user name.\n';
    if (_validateField(passwordTextEditingController.text)) errorMessage += 'Invalid password.\n';
    if (_validateField(confirmPasswordTextEditingController.text))
      errorMessage += 'Invalid confirm password.\n';
    if (passwordTextEditingController.text != confirmPasswordTextEditingController.text)
      errorMessage += 'Passwords don\'t match.\n';
    return errorMessage;
  }

  void _clearFields() {
    emailTextEditingController.text = '';
    passwordTextEditingController.text = '';
    confirmPasswordTextEditingController.text = '';
  }

  @override
  void dispose() {
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    confirmPasswordTextEditingController.dispose();
    super.dispose();
  }
}
