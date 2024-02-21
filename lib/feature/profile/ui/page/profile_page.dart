import 'package:flutter/material.dart';
import 'package:solution_app/core/service-locator/service_locator_manager.dart';
import 'package:solution_app/core/ui/button/custom_button.dart';
import 'package:solution_app/feature/auth/bloc/auth_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomButton.h2(
            title: "Logout",
            onPressed: () {
              globalSL<AuthBloc>().add(LogoutAuthEvent());
            }),
      ),
    );
  }
}
