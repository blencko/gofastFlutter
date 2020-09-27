import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'dart:io';
import 'app/app_module.dart';
import 'package:flutter/foundation.dart';

void main() {
    FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode)
      exit(1);
  };
  runApp(
    ModularApp(
      module: AppModule()
      )
    );
}
