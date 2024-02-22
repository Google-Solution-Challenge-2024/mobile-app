import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solution_app/core/config/custom_theme_extension.dart';
import 'package:solution_app/core/service-locator/service_locator_manager.dart';
import 'package:solution_app/core/ui/button/custom_button.dart';
import 'package:solution_app/feature/test/model/test.dart';
import 'package:solution_app/navigation/auth_navigation.dart';

class IntructionTestPage extends StatefulWidget {
  final TestModel testModel;
  const IntructionTestPage({super.key, required this.testModel});

  @override
  State<IntructionTestPage> createState() => _IntructionTestPageState();
}

class _IntructionTestPageState extends State<IntructionTestPage> {
  @override
  Widget build(BuildContext context) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(),
          Text(
            "Instructions",
            style: theme.headline2.copyWith(fontSize: 20.sp),
          ),
          SizedBox(height: 150.h),
          SizedBox(
            width: 250.w,
            child: Text(
              widget.testModel.instruction,
              style: theme.headline4,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 250.h),
          CustomButton.h1(
            title: "Start",
            onPressed: () {
              globalSL<AuthNavigation>()
                  .globalRouter
                  .push(widget.testModel.path);
            },
          ),
          SizedBox(height: 50.h),
        ],
      ),
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
        widget.testModel.title,
        style: theme.headline3,
      ),
      centerTitle: true,
      elevation: 0,
    );
  }
}
