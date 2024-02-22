import 'package:flutter/material.dart';
import 'package:solution_app/core/config/custom_theme_extension.dart';
import 'package:solution_app/core/service-locator/service_locator_manager.dart';
import 'package:solution_app/navigation/auth_navigation.dart';

class HandTestPage extends StatelessWidget {
  const HandTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return AppBar(
      leading: IconButton(
        onPressed: () {
          globalSL<AuthNavigation>().globalRouter.pop();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: theme.textColor1,
        ),
      ),
      title: Text(
        "Hand movement",
        style: theme.headline3,
      ),
      centerTitle: true,
      elevation: 0,
    );
  }
}
