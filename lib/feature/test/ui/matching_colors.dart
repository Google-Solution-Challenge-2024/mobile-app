import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solution_app/core/config/custom_theme_extension.dart';
import 'package:solution_app/core/config/ui_config.dart';
import 'package:solution_app/core/service-locator/service_locator_manager.dart';
import 'package:solution_app/navigation/auth_navigation.dart';

class MatchingColorsPage extends StatefulWidget {
  const MatchingColorsPage({super.key});

  @override
  State<MatchingColorsPage> createState() => _MatchingColorsPageState();
}

class _MatchingColorsPageState extends State<MatchingColorsPage> {
  int timeLeft = 60;
  int count = 0;
  List<ColoredCell> colors = [];

  List<Color> optionColors = [
    UiConfig.primaryBlue,
    UiConfig.primaryColor,
    UiConfig.primaryYellow,
  ];

  @override
  void initState() {
    super.initState();
    _startCountDown();
    var rnd = Random();
    for (var i = 0; i < 25; i++) {
      colors.add(
        ColoredCell(
            color: optionColors[rnd.nextInt(optionColors.length)], index: i),
      );
    }
  }

  void _startCountDown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft -= 1;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50.h),
          Text(
            "Tap colored cells",
            style: theme.headline2.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 30.h),
          Text(
            timeLeft > 10 ? "00:$timeLeft" : "00:0$timeLeft",
            style: theme.headline1.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 30.sp,
            ),
          ),
          SizedBox(height: 30.h),
          SizedBox(
            height: 300.h,
            width: 300.h,
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 5,
              mainAxisSpacing: 10.w,
              crossAxisSpacing: 10.w,
              children: [for (var c in colors) _buildDraggable(c)],
            ),
          ),
          SizedBox(height: 30.h),
          _buildTargets(),
        ],
      ),
    );
  }

  Widget _buildTargets() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [for (var c in optionColors) _buildTarget(c)],
    );
  }

  Widget _buildTarget(Color color) {
    return DragTarget<ColoredCell>(
      onAccept: (data) {
        if (data.color == color) {
          setState(() {
            data.setIsRemoved();
            count++;
          });

          if (count == 25) {
            globalSL<AuthNavigation>().globalRouter.pushReplacement(
                  AuthNavigation.gameResult,
                  extra: true,
                );
          }
        }
      },
      builder: (
        BuildContext context,
        List<ColoredCell?> candidateData,
        List<dynamic> rejectedData,
      ) {
        return Container(
          width: 100.w,
          height: 100.w,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20.w),
          ),
        );
      },
    );
  }

  Widget _buildDraggable(ColoredCell c) {
    return Container(
      width: 50.w,
      height: 50.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
        color: Colors.grey.withOpacity(0.3),
      ),
      child: Draggable<ColoredCell>(
        data: c,
        feedback: _buildColoredBox(c),
        childWhenDragging: _buildColoredBox(
            ColoredCell(color: Colors.grey.withOpacity(0.3), index: c.index)),
        child: _buildColoredBox(c),
      ),
    );
  }

  Widget _buildColoredBox(ColoredCell color) {
    return Container(
      width: 50.w,
      height: 50.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.w),
        color: !color.isRemoved ? color.color : Colors.grey.withOpacity(0.3),
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
        "Match colors",
        style: theme.headline3,
      ),
      centerTitle: true,
      elevation: 0,
    );
  }
}

class ColoredCell {
  final Color color;
  final int index;
  bool isRemoved = false;

  ColoredCell({required this.color, required this.index});

  setIsRemoved() {
    isRemoved = true;
  }
}
