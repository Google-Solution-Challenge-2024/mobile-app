import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solution_app/core/config/custom_theme_extension.dart';

class HorizontalProgressContainer extends StatelessWidget {
  const HorizontalProgressContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return Container(
      width: double.infinity,
      height: 60.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.sp),
      ),
      padding: EdgeInsets.all(8.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your Progress",
            style: theme.headline3,
          ),
          Text(
            "1 of 6 tests completed",
            style: theme.headline3.copyWith(
              color: theme.textColor1.withOpacity(0.5),
              fontWeight: FontWeight.w400,
              fontSize: 10.sp,
            ),
          ),
          SizedBox(height: 5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildProgressItem(theme.primaryColor),
              _buildProgressItem(theme.primaryColor),
              _buildProgressItem(theme.primaryColor),
              _buildProgressItem(theme.textColor2.withOpacity(0.3)),
              _buildProgressItem(theme.textColor2.withOpacity(0.3)),
              _buildProgressItem(theme.textColor2.withOpacity(0.3)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressItem(Color color) {
    return Container(
      width: 50.w,
      height: 5.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.sp),
        color: color,
      ),
    );
  }
}
