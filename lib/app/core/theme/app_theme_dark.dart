import 'package:flutter/src/material/theme_data.dart';
import 'package:gofast/app/core/interfaces/theme_app_interfaces.dart';

class AppThemeDark implements IThemeAppInterface {
  @override
  ThemeData getTheme() {
    return ThemeData.dark();
  }
}
