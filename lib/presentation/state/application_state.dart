import 'package:flutter/material.dart';

class ApplicationState {
  final ThemeMode themeMode;

  ApplicationState({required this.themeMode});

  ApplicationState copyWith({ThemeMode? themeMode}) {
    return ApplicationState(themeMode: themeMode ?? this.themeMode);
  }
}
