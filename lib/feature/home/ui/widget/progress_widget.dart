import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:solution_app/core/config/custom_theme_extension.dart';

class ProgressWidget extends StatelessWidget {
  ProgressWidget({super.key});

  ValueNotifier<double> valueNotifier = ValueNotifier(65.0);

  @override
  Widget build(BuildContext context) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80.h,
      decoration: BoxDecoration(
          color: theme.primaryYellow,
          borderRadius: BorderRadius.circular(20.sp)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Row(
          children: [
            SimpleCircularProgressBar(
              size: 50.h,
              progressStrokeWidth: 3.sp,
              backStrokeWidth: 3.sp,
              valueNotifier: valueNotifier,
              mergeMode: false,
              onGetText: (value) {
                return Text(
                  '${value.toInt()}',
                  style: theme.headline2,
                );
              },
              progressColors: [theme.primaryColor],
              backColor: Colors.white,
            ),
            SizedBox(width: 30.sp),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Due Date: ",
                    style: theme.headline2.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
                    children: [
                      TextSpan(
                        text: "28th May",
                        style: theme.headline2
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Text(
                  "14 weeks left to pass the tests",
                  style: theme.headline4.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
