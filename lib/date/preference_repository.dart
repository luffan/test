import 'package:shared_preferences/shared_preferences.dart';

class PreferenceRepository {
  static const String _username = 'username';
  static const String _password = 'password';
  static const String _email = 'email';

  Future<SharedPreferences> get _prefs async {
    return await SharedPreferences.getInstance();
  }

  void saveUsername(String username) {
    _prefs.then((prefs) => prefs.setString(_username, username));
  }

  Future<String> getUsername() {
    return _prefs.then((prefs) => prefs.getString(_username) ?? '');
  }

  void savePassword(String password) {
    _prefs.then((prefs) => prefs.setString(_password, password));
  }

  Future<String> getPassword() {
    return _prefs.then((prefs) => prefs.getString(_password) ?? '');
  }

  void saveEmail(String email) {
    _prefs.then((prefs) => prefs.setString(_email, email));
  }

  Future<String> getEmail() {
    return _prefs.then((prefs) => prefs.getString(_email) ?? '');
  }

}