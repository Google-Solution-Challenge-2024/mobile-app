import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:solution_app/core/config/custom_theme_extension.dart';
import 'package:solution_app/core/config/ui_config.dart';
import 'package:solution_app/core/service-locator/service_locator_manager.dart';
import 'package:solution_app/feature/auth/bloc/auth_bloc.dart';
import 'package:solution_app/navigation/auth_navigation.dart';
import 'package:solution_app/navigation/loading_page.dart';
import 'package:solution_app/navigation/unauth_navigation.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigation();
}

class _MainNavigation extends State<MainNavigation> {
  @override
  void initState() {
    super.initState();
    globalSL<AuthBloc>().add(AppStartedAuthEvent());
  }

  @override
  void dispose() {
    super.dispose();
    globalSL<AuthBloc>().close();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(UiConfig.globalWidth, UiConfig.globalHeight),
      builder: (_, __) => BlocBuilder<AuthBloc, AuthState>(
        bloc: globalSL<AuthBloc>(),
        builder: (BuildContext context, AuthState state) {
          GoRouter router = getLoading;
          if (state is UnauthenticatedAuthState) {
            router = globalSL<UnauthNavigation>().goRouter;
          } else if (state is AuthenticatedAuthState) {
            router = globalSL<AuthNavigation>().globalRouter;
          }
          return MaterialApp.router(
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
            routeInformationProvider: router.routeInformationProvider,
            debugShowCheckedModeBanner: false,
            theme: CustomThemeExtension.lightThemeData,
            darkTheme: CustomThemeExtension.darkThemeData,
            themeMode: ThemeMode.light,
          );
        },
      ),
    );
  }

  GoRouter get getLoading => GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (BuildContext context, GoRouterState state) {
              return const LoadingPage();
            },
          )
        ],
      );
}
