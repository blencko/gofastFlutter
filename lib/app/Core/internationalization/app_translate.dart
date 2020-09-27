import 'package:flutter/cupertino.dart';
import 'package:projeto_aula1/app/Core/internationalization/app_localization.dart';

class AppTranslate {

  final BuildContext context;

  AppTranslate(this.context);

  String text(String key){
    return AppLocalizations.of(context).translate(key);
  }


}