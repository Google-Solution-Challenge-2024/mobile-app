import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solution_app/core/config/custom_theme_extension.dart';
import 'package:solution_app/feature/home/ui/widget/general_child_development_tests_widget.dart';
import 'package:solution_app/feature/home/ui/widget/progress_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(),
              ProgressWidget(),
              GeneralChildDevelopmentTests(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.menu,
          color: theme.textColor1,
        ),
      ),
      title: Text(
        "Diagnostic Tests",
        style: theme.headline3,
      ),
      centerTitle: true,
      elevation: 0,
    );
  }
}
