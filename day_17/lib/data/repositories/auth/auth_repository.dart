import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../configs/services/dio/dio_service.dart';
import '../../../core/api/api.dart';

abstract class AuthRepository {
  Future<bool> isLoggedIn();
  Future<void> login({required String email, required String password});
  Future<void> logout();
}

const String _authKey = 'auth_token';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._dioService);

  final DioService _dioService;
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  @override
  Future<bool> isLoggedIn() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    String? token = await _getToken();
    return token != null;
  }

  @override
  Future<void> login({required String email, required String password}) async {
    try {
      final response = await _dioService.post(
        url: Api.authLogin,
        data: {'username': email, 'password': password},
      );
      if (response.statusCode == 200) {
        await _saveToken(response.data['token']);
      } else {
        throw Exception('Login failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Login failed: ${e.toString()}');
    }
  }

  @override
  Future<void> logout() async {
    await _deleteToken();
  }

  Future<void> _saveToken(String token) async {
    await _secureStorage.write(key: _authKey, value: token);
  }

  Future<String?> _getToken() async {
    return await _secureStorage.read(key: _authKey);
  }

  Future<void> _deleteToken() async {
    await _secureStorage.deleteAll();
  }
}
