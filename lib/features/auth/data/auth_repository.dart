import 'package:lacquer/features/auth/data/auth_api_client.dart';
import 'package:lacquer/features/auth/data/auth_local_data_source.dart';
import 'package:lacquer/features/auth/dtos/login_dto.dart';
import 'package:lacquer/features/auth/dtos/login_success_dto.dart';
import 'package:lacquer/features/auth/dtos/register_dto.dart';

import 'package:lacquer/features/auth/result_type.dart';

class AuthRepository {
  final AuthApiClient authApiClient;
  final AuthLocalDataSource authLocalDataSource;

  AuthRepository({
    required this.authApiClient,
    required this.authLocalDataSource,
  });

  Future<Result<void>> login(String email, String password) async {
    try {
      final loginSuccessDto = await authApiClient.login(
        LoginDto(email: email, password: password),
      );
      await authLocalDataSource.saveToken(loginSuccessDto.token);
      return Success(null);
    } catch (e) {
      return Failure(e.toString());
    }
  }

  Future<Result<void>> register(String username, String email, String password, String authProvider) async {
    try {
      await authApiClient.register(
       RegisterDto(username: username, email: email, password: password, authProvider: authProvider),
     );
    }
    catch (e) {
     return Failure(e.toString());
    }
    return Success(null);
   }
}
