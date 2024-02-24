import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solution_app/core/config/custom_theme_extension.dart';
import 'package:solution_app/core/service-locator/service_locator_manager.dart';
import 'package:solution_app/core/ui/button/custom_button.dart';
import 'package:solution_app/feature/auth/bloc/auth_bloc.dart';
import 'package:solution_app/feature/home/ui/widget/test_list_widget.dart';
import 'package:solution_app/feature/test/model/test_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          _buildProfileCard(),
          SizedBox(height: 10.h),
          Center(
            child: CustomButton.h2(
              title: "Logout",
              onPressed: () {
                globalSL<AuthBloc>().add(LogoutAuthEvent());
              },
            ),
          ),
          SizedBox(height: 30.h),
          TestListWidget(
            title: 'Learn more',
            max: 6,
            current: 3,
            tests: specialTestList,
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          _buildNameDetails(),
          SizedBox(height: 20.h),
          _buildBabyDetails(),
        ],
      ),
    );
  }

  Widget _buildBabyDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildKeyValue("Baby Height", "87.3cm"),
        _buildKeyValue("Baby Weight", "12.9kg"),
        _buildKeyValue("Age", "2y.o"),
      ],
    );
  }

  Widget _buildKeyValue(String key, String value) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          key,
          style: theme.headline3.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          value,
          style: theme.headline3.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildNameDetails() {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 30.w,
        ),
        Container(
          height: 60.w,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1.sp,
                color: Colors.grey.withOpacity(0.4),
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Yernar Duisebay",
                style: theme.headline1.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Male, 17 Feb 2019",
                style: theme.headline4.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 60.w),
        SvgPicture.asset("assets/icons/filter.svg"),
      ],
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.menu,
          color: theme.textColor1,
        ),
      ),
      title: Text(
        "Profile",
        style: theme.headline3,
      ),
      centerTitle: true,
      elevation: 0,
    );
  }
}
