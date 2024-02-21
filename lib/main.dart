import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solution_app/core/app/app_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  const AppWrapper appWrapper = AppWrapper();
  appWrapper.init();

  runApp(appWrapper);
}
