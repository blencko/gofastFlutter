import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:projeto_aula1/app/Core/internationalization/app_localization.dart';
import 'package:projeto_aula1/app/Core/theme/app_theme_dark.dart';
import 'package:projeto_aula1/app/Core/theme/app_theme_ligth.dart';
import 'package:projeto_aula1/app/app_controller.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return MaterialApp(
          title: 'Flutter Go Fast',
          theme: Modular.get<AppController>().themeApp.getTheme(),
          initialRoute: '/',
          navigatorKey: Modular.navigatorKey,
          onGenerateRoute: Modular.generateRoute,
          supportedLocales: [
            Locale('en', 'US'),
            Locale('pt', 'BR'),
          ],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale.languageCode &&
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
        );
      }
    );
  }
}
