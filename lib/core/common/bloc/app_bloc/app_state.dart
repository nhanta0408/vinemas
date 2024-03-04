// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../model/bloc_status_state.dart';

class AppState {
  BlocStatusState status;
  Locale? locale;
  AppState({
    this.locale,
    required this.status,
  });

  AppState copyWith({
    Locale? locale,
    required BlocStatusState status,
  }) {
    return AppState(
      locale: locale ?? this.locale,
      status: status,
    );
  }
}
