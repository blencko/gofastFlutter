import 'package:flutter/material.dart';
import 'package:projeto_aula1/app/Core/interfaces/theme_app_interface.dart';

class AppThemeLight implements IThemeAppInterface {
  @override
  ThemeData getTheme() {
    return ThemeData.light();
  }
}
