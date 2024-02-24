import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solution_app/core/config/custom_theme_extension.dart';
import 'package:solution_app/feature/home/ui/widget/test_list_widget.dart';
import 'package:solution_app/feature/home/ui/widget/progress_widget.dart';
import 'package:solution_app/feature/test/model/test_model.dart';

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
              const Row(),
              ProgressWidget(),
              SizedBox(height: 20.h),
              TestListWidget(
                title: 'General child development tests',
                max: 6,
                current: 3,
                tests: generalTestsList,
              ),
              SizedBox(height: 20.h),
              TestListWidget(
                title: 'Special tests',
                max: 6,
                current: 3,
                tests: specialTestList,
              ),
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
