import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:solution_app/core/app/app_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  const AppWrapper appWrapper = AppWrapper();
  appWrapper.init();

  Gemini.init(apiKey: 'AIzaSyBu5bjPVn98s24wbGP1IElLJ6KxS4yetmI');

  runApp(appWrapper);
}
