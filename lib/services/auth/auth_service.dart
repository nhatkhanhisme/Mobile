import 'package:dio/dio.dart';

class AuthService {
  final Dio _dio = Dio();

  Future<Response?> signin(email, password) async {
    try {
      final response = await _dio.post(
        'http://localhost:3000/auth/login',
        data: {'email': email, 'password': password},
      );
      return response;
    } catch (e) {
      print('$e');
      return null;
    }
  }

  Future<Response?> signup(username, email, password, authProvider) async {
    try {
      final response = await _dio.post(
        'http://localhost:3000/auth/register',
        data: {
          'username': username,
          'email': email,
          'password': password,
          'authProvider': authProvider,
        },
      );
      return response;
    } catch (e) {
      print('$e');
      return null;
    }
  }
}
