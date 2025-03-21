import 'package:dio/dio.dart';
import 'package:lacquer/features/auth/dtos/login_dto.dart';
import 'package:lacquer/features/auth/dtos/login_success_dto.dart';
import 'package:lacquer/features/auth/dtos/register_dto.dart';
import 'package:lacquer/features/auth/dtos/register_success_dto.dart';

class AuthApiClient {
  AuthApiClient(this.dio);

  final Dio dio;

  Future<LoginSuccessDto> login(LoginDto loginDto) async {
    final response = await dio.post(
      '/auth/login',
      data: {
        'email': loginDto.email,
        'password': loginDto.password,
      },
    );

    return LoginSuccessDto.fromJson(response.data);
  }

  Future<RegisterSuccessDto> register(RegisterDto registerDto) async {
     final response = await dio.post(
       'auth/register',
       data: {
         'username': registerDto.username,
         'email': registerDto.email,
         'password': registerDto.password,
         'authProvider': registerDto.authProvider,
       },
     );
 
     return RegisterSuccessDto.fromJson(response.data);
   }
}
