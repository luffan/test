import 'package:shared_preferences/shared_preferences.dart';

class PreferenceRepository {
  static const String _username = 'username';
  static const String _password = 'password';
  static const String _email = 'email';

  Future<SharedPreferences> get _prefs async {
    return await SharedPreferences.getInstance();
  }

  Future<void> saveUsername(String username) {
    return _prefs.then((prefs) => prefs.setString(_username, username));
  }

  Future<String> getUsername() {
    return _prefs.then((prefs) => prefs.getString(_username) ?? '');
  }

  Future<void> savePassword(String password) {
    return _prefs.then((prefs) => prefs.setString(_password, password));
  }

  Future<String> getPassword() {
    return _prefs.then((prefs) => prefs.getString(_password) ?? '');
  }

  Future<void> saveEmail(String email) {
    return _prefs.then((prefs) => prefs.setString(_email, email));
  }

  Future<String> getEmail() {
    return _prefs.then((prefs) => prefs.getString(_email) ?? '');
  }

}