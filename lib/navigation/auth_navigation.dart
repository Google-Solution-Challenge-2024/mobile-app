import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:solution_app/core/service-locator/service_locator.dart';
import 'package:solution_app/core/service-locator/service_locator_manager.dart';
import 'package:solution_app/feature/slider/ui/pages/slider_page.dart';
import 'package:solution_app/navigation/bottom_navigation.dart';

class AuthNavigation implements ServiceLocator {
  static const String home = '/';
  static const String slider = '/slider';

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
