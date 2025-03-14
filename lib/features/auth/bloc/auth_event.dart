class AuthEvent {}

class AuthEventLogin extends AuthEvent {
  AuthEventLogin({required this.email, required this.password});

  final String email;
  final String password;
}

class AuthEventRegister extends AuthEvent {}

