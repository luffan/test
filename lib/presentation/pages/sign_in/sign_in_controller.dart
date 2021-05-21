import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:profile/date/preference_repository.dart';

class SignInController extends GetxController {
  PreferenceRepository _preference;
  final usernameTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  SignInController(this._preference);

  void signIn() async {
    final errorMessage = await checkFields();
    if (errorMessage.isEmpty) {
      Get.toNamed('/profile/${usernameTextEditingController.text}');
    } else {
      Get.defaultDialog(
        title: "Error",
        middleText: errorMessage,
      );
    }

  }

  void goToSignUp() => Get.toNamed('/signUp');

  Future<bool> _validateUsername(String username) async {
    if (username.isEmpty) {
      return false;
    }
    //final prefUsername = await _preference.getUsername();
    //return prefUsername == username;
    return true;
  }

  Future<bool> _validatePassword(String password) async {
    if (password.isEmpty) {
      return false;
    }

    final prefPassword = await _preference.getPassword();

    return prefPassword == password;
  }

  Future<String> checkFields() async {
    var errorMessage = '';
    final isCorrectUsername = await _validateUsername(usernameTextEditingController.text);
    final isCorrectPassword = await _validatePassword(passwordTextEditingController.text);
    if (!isCorrectUsername) errorMessage += 'There is no such user name\n';
    if (!isCorrectPassword) errorMessage += 'Invalid password\n';
    return errorMessage;
  }



}
