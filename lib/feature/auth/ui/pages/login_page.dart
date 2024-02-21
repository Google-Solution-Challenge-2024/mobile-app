import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solution_app/core/config/custom_theme_extension.dart';
import 'package:solution_app/core/service-locator/service_locator_manager.dart';
import 'package:solution_app/core/ui/button/custom_button.dart';
import 'package:solution_app/feature/auth/bloc/auth_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Container()),
          buildSigninBtn(
            context,
            "assets/icons/google.png",
            "Signin with Google",
            () {
              globalSL<AuthBloc>().add(LoginAuthEvent());
            },
          ),
          SizedBox(height: 20.h),
          buildSigninBtn(
            context,
            "assets/icons/apple.png",
            "Signin with Apple",
            () {
              globalSL<AuthBloc>().add(LoginAuthEvent());
            },
          ),
          buildConsentText(context),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  Widget buildSigninBtn(
    BuildContext context,
    String img,
    String text,
    Function() onTap,
  ) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return CustomButton(
      color: Colors.white,
      onPressed: onTap,
      title: "",
      isLoading: false,
      isDisabled: false,
      width: 300.w,
      height: 50.h,
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Row(
          children: [
            Image.asset(
              img,
              width: 30.w,
              height: 30.w,
            ),
            SizedBox(width: 20.w),
            Text(
              text,
              style: theme.headline3.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildConsentText(BuildContext context) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    TextStyle txtStyle = TextStyle(
      fontFamily: 'Open Sans',
      color: theme.textColor1,
      fontSize: 14.sp,
    );

    return Padding(
      padding: EdgeInsets.all(40.w),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'By logging in, you consent to abide by our ',
          style: txtStyle,
          children: <TextSpan>[
            TextSpan(
              text: 'terms of service',
              style: txtStyle.copyWith(
                color: const Color(0xffEC407A),
              ),
            ),
            TextSpan(
              text: ' and ',
              style: txtStyle,
            ),
            TextSpan(
              text: ' privacy policy',
              style: txtStyle.copyWith(
                color: const Color(0xffEC407A),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
