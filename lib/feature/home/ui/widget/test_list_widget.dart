import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solution_app/core/config/custom_theme_extension.dart';
import 'package:solution_app/core/service-locator/service_locator_manager.dart';
import 'package:solution_app/feature/home/ui/widget/horizontal_progress_container.dart';
import 'package:solution_app/feature/test/model/test_model.dart';
import 'package:solution_app/navigation/auth_navigation.dart';

class TestListWidget extends StatelessWidget {
  final String title;
  final int max;
  final int current;
  final List<TestModel> tests;
  const TestListWidget(
      {super.key,
      required this.title,
      required this.max,
      required this.current,
      required this.tests});

  @override
  Widget build(BuildContext context) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.headline3.copyWith(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 30.h),
        HorizontalProgressContainer(
          max: max,
          current: current,
        ),
        SizedBox(height: 20.h),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 500.h,
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            primary: false,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 10.w,
            crossAxisCount: 2,
            children: <Widget>[for (var t in tests) _buildItem(theme, t)],
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }

  Widget _buildItem(CustomThemeExtension theme, TestModel test) {
    return InkWell(
      onTap: () {
        globalSL<AuthNavigation>().globalRouter.push(
              AuthNavigation.instruction,
              extra: test,
            );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              test.icon,
              width: 40.w,
              height: 40.w,
            ),
            SizedBox(height: 7.h),
            Text(
              test.title,
              style: theme.headline4.copyWith(fontSize: 12.sp),
            )
          ],
        ),
      ),
    );
  }
}
