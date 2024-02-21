import 'package:flutter/material.dart';
import 'package:solution_app/core/service-locator/service_locator_manager.dart';
import 'package:solution_app/feature/auth/unauth_sl.dart';
import 'package:solution_app/feature/slider/slider_sl.dart';
import 'package:solution_app/navigation/auth_navigation.dart';
import 'package:solution_app/navigation/navigation.dart';
import 'package:solution_app/navigation/unauth_navigation.dart';

class AppWrapper extends StatelessWidget {
  const AppWrapper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MainNavigation();
  }

  Future<void> init() async {
    await ServiceLocatorManager.init(
      services: [
        UnauthServiceLocator(),
        AuthNavigation(routeObserver: RouteObserver<ModalRoute>()),
        UnauthNavigation(),
        SliderServiceLocator(),
      ],
    );
  }
}
