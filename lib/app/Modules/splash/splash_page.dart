import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_aula1/app/Core/internationalization/app_translate.dart';
import 'package:projeto_aula1/app/app_controller.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
            RaisedButton(child: Text('tema escuro'),
            onPressed: (){
              Modular.get<AppController>().setThemeData(ThemeMode.dark);
            },
            ),
            RaisedButton(child: Text('tema claro'),
            onPressed: (){
              Modular.get<AppController>().setThemeData(ThemeMode.light);

            },
            ),
          ]
          ),
      ),
      );
    
  }
}
