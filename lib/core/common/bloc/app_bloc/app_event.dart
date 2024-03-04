// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

abstract class AppEvent {}

class ChangeLanguageAppEvent extends AppEvent {
  Locale locale;
  ChangeLanguageAppEvent({
    required this.locale,
  });
}
