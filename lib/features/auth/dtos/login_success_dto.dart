class LoginSuccessDto {
  final String token;
  final String userId;
  final String username;

  const LoginSuccessDto({
    required this.token,
    required this.userId,
    required this.username,
    });

  factory LoginSuccessDto.fromJson(Map<String, dynamic> json) {
    return LoginSuccessDto(
      token: json['token'] as String,
      userId: json['userId'] as String,
      username: json['username'] as String);
  }
}
