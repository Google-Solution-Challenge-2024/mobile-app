import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_slider/source/source.dart';
import 'package:solution_app/core/config/custom_theme_extension.dart';
import 'package:solution_app/core/service-locator/service_locator_manager.dart';
import 'package:solution_app/feature/slider/bloc/bloc/slider_bloc.dart';
import 'package:solution_app/navigation/auth_navigation.dart';
import 'package:solution_app/navigation/bottom_navigation.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  @override
  Widget build(BuildContext context) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return Scaffold(
      body: IntroductionSlider(
        items: [
          buildItem(
            context,
            "Professional",
            "Tests",
            "assets/icons/baby.png",
          ),
          buildItem(
            context,
            "Educational",
            "Resources",
            "assets/icons/baby.png",
          ),
          buildItem(
            context,
            "Supportive",
            "Community",
            "assets/icons/baby.png",
          ),
        ],
        done: Done(
          child: InkWell(
            onTap: () {
              globalSL<SliderBloc>().add(FinisedSliderEvent());
            },
            child: Padding(
              padding: EdgeInsets.only(right: 30.sp),
              child: Text(
                "Done".toUpperCase(),
                style: theme.headline4,
              ),
            ),
          ),
          home: const Scaffold(),
        ),
        next: Next(
          child: Padding(
            padding: EdgeInsets.only(right: 30.sp),
            child: Text(
              "Next".toUpperCase(),
              style: theme.headline4,
            ),
          ),
        ),
        back: Back(
          child: Padding(
            padding: EdgeInsets.only(left: 30.sp),
            child: Text(
              "Back".toUpperCase(),
              style: theme.headline4,
            ),
          ),
        ),
        dotIndicator: DotIndicator(
          selectedColor: theme.primaryYellow,
          unselectedColor: theme.primaryBlue,
        ),
      ),
    );
  }

  IntroductionSliderItem buildItem(
    BuildContext context,
    String title1,
    String title2,
    String image,
  ) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return IntroductionSliderItem(
      logo: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                text: '$title1 ',
                style: theme.headline1.copyWith(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w300,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: title2,
                    style: theme.headline1.copyWith(
                      color: theme.primaryColor,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 80.sp),
            Image.asset(
              image,
              width: 150.w,
            ),
          ],
        ),
      ),
      title: Padding(
        padding: EdgeInsets.all(18.sp),
        child: Text(
          "The app will provide tracking tools to help users monitor their pregnancy and postpartum progress, including weight tracking, contraction timing, and breastfeeding tracker.",
          textAlign: TextAlign.center,
          style: theme.headline1.copyWith(
            fontSize: 13.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
