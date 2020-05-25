import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gofast/app/core/interfaces/shared_repository_interface.dart';
import 'package:gofast/app/core/interfaces/theme_app_interfaces.dart';
import 'package:gofast/app/core/repositories/shared_repository.dart';
import 'package:gofast/app/core/theme/app_theme_dark.dart';
import 'package:gofast/app/core/theme/app_theme_light.dart';
import 'package:mobx/mobx.dart';
part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  SharedRepository sharedRepository = Modular.get<ISharedRepositoryInterface>();

  _AppControllerBase() {
    getThemeData();
  }
  @observable
  IThemeAppInterface themeApp = AppThemeLight();

  @action
  getThemeData() async {
    await sharedRepository.getValue<String>('theme_mode').then(
      (value) {
        setThemeData(
          value == 'ThemeMode.dark' ? ThemeMode.dark : ThemeMode.light,
        );
      },
    );
  }

  @action
  setThemeData(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.dark:
        themeApp = AppThemeDark();
        break;
      default:
        themeApp = AppThemeLight();
        break;
    }
  }
}
