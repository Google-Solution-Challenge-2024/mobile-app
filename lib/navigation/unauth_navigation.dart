import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:solution_app/core/service-locator/service_locator.dart';
import 'package:solution_app/feature/auth/ui/pages/login_page.dart';

class UnauthNavigation extends ServiceLocator {
  static const String login = '/';

  final GoRouter goRouter;
  UnauthNavigation() : goRouter = _router;

  static GoRouter get _router => GoRouter(
        routes: <GoRoute>[
          GoRoute(
            path: login,
            builder: (BuildContext context, GoRouterState state) {
              return const LoginPage();
            },
          ),
        ],
      );

  @override
  Future<void> call(GetIt sl) async {
    sl.registerLazySingleton<UnauthNavigation>(() => this);
  }
}
