import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:my_first_app/app/app.locator.dart';

class AuthenticationService {
  final _storage = locator<FlutterSecureStorage>();
  final String _tokenKey = 'auth_key_token';

  Future<void> login() async {
    const String authToken = 'auth_token';
    await _storage.write(key: _tokenKey, value: authToken);
  }

  Future<void> logout() async {
    await _storage.delete(key: _tokenKey);
  }

  Future<bool> isLogged() async {
    String? authToken = await _storage.read(key: _tokenKey);
    return authToken != null;
  }

  Future<String?> getAuthToken() async {
    return await _storage.read(key: _tokenKey);
  }
}
