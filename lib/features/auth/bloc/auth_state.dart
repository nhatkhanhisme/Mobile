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

 class AuthAuthenticatedUnknown extends AuthState {}

 class AuthLogoutSuccess extends AuthState {}

 class AuthLogoutFailure extends AuthState {
    final String message;
  
    AuthLogoutFailure(this.message);
 }