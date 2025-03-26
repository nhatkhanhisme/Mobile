sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoginInProgress extends AuthState {}

class AuthLoginSuccess extends AuthState {}
class AuthLoginFailure extends AuthState {
  final String message;

  AuthLoginFailure(this.message);
}

class AuthRegisterInProgress extends AuthState {}
 
class AuthRegisterSuccess extends AuthState {}
class AuthRegisterFailure  extends AuthState {
   final String message;
 
   AuthRegisterFailure(this.message);
 }

 class AuthAuthenticatedSuccess extends AuthState {
  final String token;

  AuthAuthenticatedSuccess(this.token);
 }

 class AuthAuthenticatedFailure extends AuthState {
    final String message;
  
    AuthAuthenticatedFailure(this.message);
 }