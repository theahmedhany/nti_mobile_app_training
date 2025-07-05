import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/auth/auth_repository.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  final AuthRepository _authRepository;
  AuthCubit(this._authRepository) : super(AuthInitialState());

  Future<bool> checkIsLoggedIn() async {
    final isLoggedIn = await _authRepository.isLoggedIn();
    return isLoggedIn;
  }

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoadingState());
    try {
      await _authRepository.login(email: email, password: password);
      emit(AuthLoggedInState());
    } catch (e) {
      emit(AuthLoggedInErrorState(e.toString()));
    }
  }

  Future<void> logout() async {
    try {
      emit(AuthLoadingState());
      await _authRepository.logout();
      emit(AuthLoggedOutState());
    } catch (e) {
      emit(AuthLoggedOutErrorState(e.toString()));
    }
  }
}
