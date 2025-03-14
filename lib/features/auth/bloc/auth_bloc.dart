import 'package:flamingo/features/auth/bloc/auth_event.dart';
import 'package:flamingo/features/auth/bloc/auth_state.dart';
import 'package:flamingo/features/auth/data/auth_repository.dart';
import 'package:flamingo/features/auth/result_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<AuthEventLogin>(_onLogin);

    on<AuthEventRegister>(_onRegister);
  }

  final AuthRepository authRepository;

  void _onLogin(AuthEventLogin event, Emitter<AuthState> emit) async {
    emit(AuthLoginInProgress());
    final result = await authRepository.login(event.email, event.password);
    return (switch(result)
    {
      Success() => emit(AuthLoginSuccess(result.username, result.userId)),
      Failure() => emit(AuthLoginFailure(result.message)),
    });
  }

  void _onRegister(AuthEventRegister event, Emitter<AuthState> emit) {}
}
