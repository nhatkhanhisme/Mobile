sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoginInProgress extends AuthState {}

class AuthLoginSuccess extends AuthState {
  final String username;
  final String userId;

  AuthLoginSuccess(this.username, this.userId);
}

class AuthLoginFailure extends AuthState {
  final String message;

  AuthLoginFailure(this.message);
}

class AuthRegisterInProgress extends AuthState {}
 
 class AuthRegisterSuccess extends AuthState {
   final String data;
 
   AuthRegisterSuccess(this.data);
 }
 
 class AuthRegisterFailure  extends AuthState {
   final String message;
 
   AuthRegisterFailure(this.message);
 }