import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solution_app/core/config/ui_config.dart';

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  final Color primaryColor; // primary color of app and used to make accent
  final Color secondaryColor; // color to make secondary accent

  final Color backgroundColor; // darkest background color

  final Color textColor1; // most active text color
  final Color textColor2; // disabled color

  final Color primaryYellow;
  final Color primaryBlue;

  CustomThemeExtension({
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
    required this.textColor1,
    required this.textColor2,
    required this.primaryYellow,
    required this.primaryBlue,
  });

  factory CustomThemeExtension.of(BuildContext context) {
    return Theme.of(context).extension<CustomThemeExtension>() ??
        CustomThemeExtension.light();
  }

  static const Color lightGreen = Color(0xffe3eeea);
  static const Color primaryBackground = Color(0xffe0dfdd);

  factory CustomThemeExtension.light() => CustomThemeExtension(
        primaryColor: const Color(0xff57BF9C),
        secondaryColor: const Color(0xffe3eeea),
        backgroundColor: const Color(0xffFAFAFA),
        textColor1: const Color(0xff000000),
        textColor2: const Color(0xff000000),
        primaryYellow: const Color(0xfffbe09d),
        primaryBlue: const Color(0xff9ec6fa),
      );

  static ThemeData get darkThemeData =>
      getThemeData(extension: CustomThemeExtension.light());

  static ThemeData get lightThemeData =>
      getThemeData(extension: CustomThemeExtension.light());

  static ThemeData getThemeData({required CustomThemeExtension extension}) {
    return ThemeData(
      inputDecorationTheme: const InputDecorationTheme(
        floatingLabelStyle: TextStyle(color: Colors.black),
      ),
      appBarTheme: AppBarTheme(color: extension.backgroundColor),
      scaffoldBackgroundColor: extension.backgroundColor,
      primaryColor: extension.primaryColor,
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: Colors.black),
      extensions: [
        extension,
      ],
    );
  }

  TextStyle get headline1 => TextStyle(
        // 700
        color: textColor1,
        fontSize: 20.h,
        fontWeight: FontWeight.w700,
        fontFamily: 'Open Sans',
      );

  TextStyle get headline2 => TextStyle(
        // 700
        color: textColor1,
        fontSize: 16.h,
        fontWeight: FontWeight.w700,
        fontFamily: 'Open Sans',
      );

  TextStyle get headline3 => TextStyle(
        // 600
        color: textColor1,
        fontSize: 14.h,
        fontWeight: FontWeight.w600,
        fontFamily: 'Open Sans',
      );

  TextStyle get headline4 => TextStyle(
        //500
        color: textColor2,
        fontSize: 14.h,
        fontWeight: FontWeight.w400,
        fontFamily: 'Open Sans',
      );

  @override
  ThemeExtension<CustomThemeExtension> lerp(
    ThemeExtension<CustomThemeExtension>? other,
    double t,
  ) {
    if (other is! CustomThemeExtension) {
      return this;
    }
    return CustomThemeExtension(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      textColor1: Color.lerp(textColor1, other.textColor1, t)!,
      textColor2: Color.lerp(textColor2, other.textColor2, t)!,
      primaryYellow: Color.lerp(primaryYellow, other.primaryYellow, t)!,
      primaryBlue: Color.lerp(primaryBlue, other.primaryBlue, t)!,
    );
  }

  @override
  ThemeExtension<CustomThemeExtension> copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? backgroundColor,
    Color? textColor1,
    Color? textColor2,
    Color? primaryYellow,
    Color? primaryBlue,
  }) {
    return CustomThemeExtension(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor1: textColor1 ?? this.textColor1,
      textColor2: textColor2 ?? this.textColor2,
      primaryYellow: primaryYellow ?? this.primaryYellow,
      primaryBlue: primaryBlue ?? this.primaryBlue,
    );
  }
}
