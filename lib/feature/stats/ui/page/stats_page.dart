import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solution_app/core/config/custom_theme_extension.dart';
import 'package:solution_app/feature/stats/ui/widgets/current_tasks_list.dart';
import 'package:solution_app/feature/stats/ui/widgets/statistics_list.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  bool isTodo = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: EdgeInsets.all(15.w),
        child: ListView(
          children: [
            const Row(),
            _buildSwitcher(),
            isTodo ? const CurrentTasksList() : const StatisticsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitcher() {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return Container(
      width: 350.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: const Color(0xffF6F6F6),
        borderRadius: BorderRadius.circular(30.h),
        border: Border.all(
          width: 2.sp,
          color: const Color(0xffE8E8E8),
        ),
      ),
      child: Row(
        children: [
          _buildItem(theme, "ToDos", true),
          _buildItem(theme, "Statistics", false),
        ],
      ),
    );
  }

  Widget _buildItem(CustomThemeExtension theme, String text, bool val) {
    return Expanded(
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.h),
        ),
        onTap: () {
          setState(() {
            isTodo = val;
          });
        },
        child: AnimatedContainer(
          height: 60.h,
          decoration: BoxDecoration(
            color: isTodo == val ? Colors.white : const Color(0xffF6F6F6),
            borderRadius: BorderRadius.circular(30.h),
          ),
          duration: const Duration(milliseconds: 200),
          child: Center(
            child: Text(
              text,
              style: theme.headline2.copyWith(
                color: isTodo == val ? theme.primaryColor : Colors.grey,
              ),
            ),
          ),
        ),
      ),
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
        "Recommendations",
        style: theme.headline3,
      ),
      centerTitle: true,
      elevation: 0,
    );
  }
}
