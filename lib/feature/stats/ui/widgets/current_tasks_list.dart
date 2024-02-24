import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solution_app/core/config/custom_theme_extension.dart';
import 'package:solution_app/feature/stats/model/stats_model.dart';

class CurrentTasksList extends StatefulWidget {
  const CurrentTasksList({super.key});

  @override
  State<CurrentTasksList> createState() => _CurrentTasksListState();
}

class _CurrentTasksListState extends State<CurrentTasksList> {
  bool isInProgress = true;

  @override
  Widget build(BuildContext context) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30.h),
        Text(
          "Current Tasks",
          style: theme.headline2.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10.h),
        _buildSwitcher(),
        SizedBox(height: 10.h),
        isInProgress
            ? _buildTasksList(currentTasks)
            : _buildTasksList(completedTasksList),
      ],
    );
  }

  Widget _buildTasksList(List<TaskModel> tasks) {
    return Column(
      children: [
        for (var t in tasks) _buildTaskItem(t),
      ],
    );
  }

  Widget _buildTaskItem(TaskModel task) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.sp),
        border: Border.all(
          width: 1.w,
          color: Colors.grey.withOpacity(0.4),
        ),
      ),
      padding: EdgeInsets.all(12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            task.title,
            style: theme.headline2.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 15.h),
          Text(
            task.text,
            maxLines: 2,
            style: theme.headline4.copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 15.h),
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/timer.svg",
                width: 20.w,
              ),
              SizedBox(width: 5.w),
              Text(
                task.timer,
                style: theme.headline4,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSwitcher() {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return Container(
      width: 350.w,
      height: 40.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.h),
        border: Border.all(
          width: 2.sp,
          color: const Color(0xffE8E8E8),
        ),
      ),
      padding: EdgeInsets.all(3.w),
      child: Row(
        children: [
          _buildItem(theme, "In Progress", true),
          _buildItem(theme, "Completed", false),
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
            isInProgress = val;
          });
        },
        child: AnimatedContainer(
          height: 50.h,
          decoration: BoxDecoration(
            color: isInProgress == val ? theme.primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(30.h),
          ),
          duration: const Duration(milliseconds: 200),
          child: Center(
            child: Text(
              text,
              style: theme.headline2.copyWith(
                color: isInProgress == val ? Colors.white : Colors.grey,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
