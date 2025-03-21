import 'package:lacquer/features/auth/data/auth_api_client.dart';
import 'package:lacquer/features/auth/data/auth_local_data_source.dart';
import 'package:lacquer/features/auth/dtos/login_dto.dart';
import 'package:lacquer/features/auth/dtos/register_dto.dart';
import 'dart:developer' as developer;

import 'package:lacquer/features/auth/result_type.dart';

class AuthRepository {
  final AuthApiClient authApiClient;
  final AuthLocalDataSource authLocalDataSource;

  AuthRepository({
    required this.authApiClient,
    required this.authLocalDataSource,
  });

  Future<Result<(String, String)>> login(String email, String password) async {
    final String userId;
    final String username;
    try {
      final loginSuccessDto = await authApiClient.login(
        LoginDto(email: email, password: password),
      );
      await authLocalDataSource.saveToken(loginSuccessDto.token);
      userId = loginSuccessDto.userId;
      username = loginSuccessDto.username;
    } catch (e) {
      developer.log(e.toString());
      return Failure(e.toString());
    }
    return Success({userId, username} as (String, String));
  }

  Future<Result<String>> register(String username, String email, String password, String authProvider) async {
     final String  message;
 
    try {
     final registerSuccessDto = await authApiClient.register(
       RegisterDto(username: username, email: email, password: password, authProvider: authProvider),
     );
     message = registerSuccessDto.message;
    }
    catch (e) {
     return Failure(e.toString());
    }
    return Success(message);
   }
}
