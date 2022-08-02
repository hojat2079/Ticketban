import 'package:shared_preferences/shared_preferences.dart';

const String usernameKey = 'username';
const String nameKey = 'name';
const String tokenKey = 'token';
const String refreshTokenKey = 'refresh_token';

class AppPreferences {
  final SharedPreferences _shP;

  AppPreferences(this._shP);

  Future<bool> setUsername(String username) async {
    return _shP.setString(usernameKey, username);
  }

  Future<String> getUsername() async {
    return _shP.getString(usernameKey) ?? "";
  }

  Future<bool> setName(String name) async {
    return _shP.setString(nameKey, name);
  }

  Future<String> getName() async {
    return _shP.getString(nameKey) ?? "";
  }

  Future<bool> saveToken(String token) async {
    return _shP.setString(tokenKey, token);
  }

  Future<String> loadToken() async {
    return _shP.getString(tokenKey) ?? "";
  }

  Future<bool> saveRefreshToken(String refreshToken) async {
    return _shP.setString(refreshTokenKey, refreshToken);
  }

  Future<String> loadRefreshToken() async {
    return _shP.getString(refreshTokenKey) ?? "";
  }
}
