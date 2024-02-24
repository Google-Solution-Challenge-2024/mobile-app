import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solution_app/core/config/custom_theme_extension.dart';

class StatisticsList extends StatefulWidget {
  const StatisticsList({super.key});

  @override
  State<StatisticsList> createState() => _StatisticsListState();
}

class _StatisticsListState extends State<StatisticsList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCard("Eye movement test"),
        _buildCard("Hand movement test"),
        _buildCard("Questionnaire test"),
      ],
    );
  }

  Widget _buildCard(String title) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        Text(
          title,
          style: theme.headline2.copyWith(
            color: const Color.fromARGB(255, 106, 106, 106),
            fontWeight: FontWeight.normal,
          ),
        ),
        SizedBox(height: 15.h),
        _buildGraph(),
      ],
    );
  }

  Widget _buildGraph() {
    return Container(
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.withOpacity(0.4),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildBar("6m"),
          _buildBar("1y"),
          _buildBar("1.5y"),
          _buildBar("2y"),
          _buildBar("2.5y"),
          _buildBar("3y"),
          _buildBar("3.5y"),
          _buildBar("4y"),
        ],
      ),
    );
  }

  Widget _buildBar(String title) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    var rnd = Random();
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 150.h,
              width: 15.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.w),
                color: Colors.grey.withOpacity(0.3),
              ),
            ),
            SizedBox(
              height: 150.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: rnd.nextDouble() * 150.h,
                    width: 15.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.w),
                      color: theme.primaryColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Text(
          title,
          style: theme.headline4.copyWith(
            color: theme.textColor2.withOpacity(0.7),
            fontSize: 12.sp,
          ),
        )
      ],
    );
  }
}
