import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profile/data/preference_repository.dart';

class SignUpController extends GetxController {
  PreferenceRepository _preference;

  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final confirmPasswordTextEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;

  SignUpController(this._preference);

  void signUp() {
    if (_formKey.currentState!.validate()) {
      _preference.saveEmail(emailTextEditingController.text);
      _preference.savePassword(passwordTextEditingController.text);
      Get.back();
    }
  }

  void goToSignIn() => Get.back();

  bool validateField(String? field) {
    return field != null && field.isNotEmpty;
  }

  bool validateConfirmPassword(String? confirmPassword) {
    if (!validateField(confirmPassword)) {
      return false;
    }
    return passwordTextEditingController.text == confirmPasswordTextEditingController.text;
  }

  @override
  void dispose() {
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    confirmPasswordTextEditingController.dispose();
    super.dispose();
  }
}
