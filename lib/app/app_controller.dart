import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:projeto_aula1/app/Core/interfaces/shared_repository_interface.dart';
import 'package:projeto_aula1/app/Core/repositories/shared_repository.dart';
import 'package:projeto_aula1/app/Core/theme/app_theme_dark.dart';
import 'package:projeto_aula1/app/Core/theme/app_theme_ligth.dart';

import 'Core/interfaces/theme_app_interface.dart';
part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
 SharedRepository sharedRepository = Modular.get<ISharedRepositoryInterface>(); 
  _AppControllerBase(){
    getThemeData();
  }

  @observable
  IThemeAppInterface themeApp = AppThemeLight();

  @action
  getThemeData() async{
    await sharedRepository.getValue<String>('theme mode').then((value){
      setThemeData(value == 'ThemeMode.dark'? ThemeMode.dark: ThemeMode.light,
      saveShared:false);
    });
  }


  @action
  setThemeData(ThemeMode themeMode, {bool saveShared = true}){
    switch (themeMode) {
      case ThemeMode.dark:
          themeApp= AppThemeDark();
        break;
      default:
        themeApp= AppThemeLight();
         break;
    }

    if(saveShared){
      await sharedRepository.setValue('theme mode', themeMode.toString());
    }

  }

 
}