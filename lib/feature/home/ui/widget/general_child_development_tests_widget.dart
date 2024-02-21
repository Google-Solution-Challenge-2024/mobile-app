import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solution_app/core/config/custom_theme_extension.dart';
import 'package:solution_app/feature/home/ui/widget/horizontal_progress_container.dart';

class GeneralChildDevelopmentTests extends StatelessWidget {
  const GeneralChildDevelopmentTests({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        Text(
          "General child development tests",
          style: theme.headline3.copyWith(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 30.h),
        const HorizontalProgressContainer(),
        SizedBox(height: 20.h),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 600.h,
          child: GridView.count(
            primary: false,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 10.w,
            crossAxisCount: 2,
            children: <Widget>[
              _buildItem(theme, "assets/icons/hands.svg", "Hand movement"),
              _buildItem(theme, "assets/icons/chat.svg", "M-CHAT-R autism"),
              _buildItem(theme, "assets/icons/eye.svg", "Eye movement "),
              _buildItem(theme, "assets/icons/list.svg", "Behavioral"),
              _buildItem(theme, "assets/icons/phys.svg", "Physical behavior"),
              _buildItem(theme, "assets/icons/game.svg", "Matching colors"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildItem(CustomThemeExtension theme, String image, String text) {
    return Container(
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
            image,
            width: 40.w,
            height: 40.w,
          ),
          SizedBox(height: 7.h),
          Text(
            text,
            style: theme.headline4.copyWith(fontSize: 12.sp),
          )
        ],
      ),
    );
  }
}
