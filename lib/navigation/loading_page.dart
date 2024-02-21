import 'package:flutter/material.dart';
import 'package:solution_app/core/config/custom_theme_extension.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Center(
        child: CircularProgressIndicator(
          color: theme.primaryColor,
        ),
      ),
    );
  }
}
