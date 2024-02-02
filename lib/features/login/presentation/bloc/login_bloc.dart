import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinemas_app/features/home/presentation/home_route.dart';
import 'package:vinemas_app/features/home/presentation/views/home_screen.dart';
import 'package:vinemas_app/features/login/data/models/sign_in_model.dart';
import 'package:vinemas_app/features/login/domain/usecases/login_usecases.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecases _usecases = LoginUsecasesImpl();
  LoginBloc() : super(InitialLoginState()) {
    on<UserPasswordLoginEvent>(_onUserPasswordLoginEvent);
    on<ThirdPartyLoginEvent>(_onThirdPartyLoginEvent);
  }
  FutureOr<void> _onUserPasswordLoginEvent(
      UserPasswordLoginEvent event, Emitter<LoginState> emit) async {
    emit(LoadingLoginState());
    try {
      final userCredential = await _usecases.siginWithUserPassword(
          signInModel:
              SignInModel(username: event.username, password: event.password));
      if (userCredential?.user?.email == null) {
        emit(FailedLoginState(errorMessage: 'Sign in failed'));
        return;
      }
      emit(SuccessfullyLoginState(
          successfulMessage:
              'Has sign in as email account ${userCredential?.user?.email ?? '--'}'));
    } catch (e) {
      emit(FailedLoginState(errorMessage: 'Sign in failed'));
    }
  }

  FutureOr<void> _onThirdPartyLoginEvent(
      ThirdPartyLoginEvent event, Emitter<LoginState> emit) async {
    emit(LoadingLoginState());
    try {
      if (event.isGoogle) {
        final userCredential = await _usecases.signinWithGoogle();
        if (userCredential?.user?.email == null) {
          emit(FailedLoginState(errorMessage: 'Sign in failed'));
          return;
        }
        emit(SuccessfullyLoginState(
            successfulMessage:
                'Has sign in as Google account ${userCredential?.user?.email ?? '--'}'));
      } else {
        final userCredential = await _usecases.signinWithFacebook();
        if (userCredential?.user?.displayName == null) {
          emit(FailedLoginState(errorMessage: 'Sign in failed'));
          return;
        }
        emit(SuccessfullyLoginState(
            successfulMessage:
                'Has sign in as Facebook account ${userCredential?.user?.displayName ?? '--'}'));
      }
    } catch (e) {
      emit(FailedLoginState(errorMessage: 'Sign in failed'));
    }
  }
}
