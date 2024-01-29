import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(InitialLoginState()) {
    on<UserPasswordLoginEvent>(_onUserPasswordLoginEvent);
  }
  FutureOr<void> _onUserPasswordLoginEvent(
      LoginEvent event, Emitter<LoginState> emit) async {
    emit(LoadingLoginState());
    await Future.delayed(const Duration(seconds: 3), () {
      emit(SuccessfullyLoginState(successfulMessage: 'Đăng nhập thành công'));
    });
  }
}
