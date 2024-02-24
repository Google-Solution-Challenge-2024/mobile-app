import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:solution_app/core/service-locator/service_locator.dart';
import 'package:solution_app/core/service-locator/service_locator_manager.dart';
import 'package:solution_app/feature/slider/ui/pages/slider_page.dart';
import 'package:solution_app/feature/test/model/test_model.dart';
import 'package:solution_app/feature/test/ui/eye_detection_page.dart';
import 'package:solution_app/feature/test/ui/hand_test_page.dart';
import 'package:solution_app/feature/test/ui/instruction_test_page.dart';
import 'package:solution_app/navigation/bottom_navigation.dart';

class AuthNavigation implements ServiceLocator {
  static const String home = '/';
  static const String slider = '/slider';
  static const String instruction = '/instruction';
  static const String handTest = '/handTest';
  static const String chatTest = '/chatTest';
  static const String eyeTest = '/eyeTest';
  static const String behavioralTest = '/behavioralTest';
  static const String physicalTest = '/physicalTest';
  static const String matchingColorsTest = '/matchingColorsTest';

  final RouteObserver<ModalRoute> routeObserver;

  final GoRouter globalRouter;
  final GoRouter mainRoutes;

  AuthNavigation({required this.routeObserver})
      : globalRouter = _globalRouter(routeObserver),
        mainRoutes = _mainRoutes;

  static GoRouter _globalRouter(RouteObserver<ModalRoute> routeObserver) {
    return GoRouter(
      observers: [routeObserver],
      routes: <GoRoute>[
        GoRoute(
          path: home,
          builder: (BuildContext context, GoRouterState state) {
            return const BottomNavigation();
          },
        ),
        GoRoute(
          path: slider,
          builder: (BuildContext context, GoRouterState state) {
            return const SliderPage();
          },
        ),
        GoRoute(
          path: instruction,
          builder: (BuildContext context, GoRouterState state) {
            final TestModel arg = state.extra as TestModel;
            return IntructionTestPage(testModel: arg);
          },
        ),
        GoRoute(
          path: handTest,
          builder: (BuildContext context, GoRouterState state) {
            return const HandTestPage();
          },
        ),
        GoRoute(
          path: chatTest,
          builder: (BuildContext context, GoRouterState state) {
            return const HandTestPage();
          },
        ),
        GoRoute(
          path: eyeTest,
          builder: (BuildContext context, GoRouterState state) {
            return const EyeDetectionTest();
          },
        ),
        GoRoute(
          path: behavioralTest,
          builder: (BuildContext context, GoRouterState state) {
            return const HandTestPage();
          },
        ),
        GoRoute(
          path: physicalTest,
          builder: (BuildContext context, GoRouterState state) {
            return const HandTestPage();
          },
        ),
        GoRoute(
          path: matchingColorsTest,
          builder: (BuildContext context, GoRouterState state) {
            return const HandTestPage();
          },
        ),
      ],
    );
  }

  static GoRouter get _mainRoutes {
    return GoRouter(routes: [
      GoRoute(
        path: home,
        builder: (BuildContext context, GoRouterState state) {
          return const BottomNavigation();
        },
      ),
    ]);
  }

  @override
  Future<void> call(GetIt sl) async {
    sl.registerLazySingleton<AuthNavigation>(() => this);
  }
}
