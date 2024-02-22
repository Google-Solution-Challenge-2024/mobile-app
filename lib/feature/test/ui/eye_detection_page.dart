import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solution_app/core/config/custom_theme_extension.dart';
import 'package:solution_app/core/service-locator/service_locator_manager.dart';
import 'package:solution_app/core/ui/button/custom_button.dart';
import 'package:solution_app/navigation/auth_navigation.dart';
import 'package:video_player/video_player.dart';

class EyeDetectionTest extends StatefulWidget {
  const EyeDetectionTest({super.key});

  @override
  State<EyeDetectionTest> createState() => _EyeDetectionTestState();
}

class _EyeDetectionTestState extends State<EyeDetectionTest> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://media.istockphoto.com/id/479309449/video/children-world.mp4?s=mp4-640x640-is&k=20&c=ZCqqusN1nKvMZrlHesLunlW0InNzuMqFxBlmGxTxEy8='))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          _controller.value.isInitialized
              ? Padding(
                  padding: EdgeInsets.all(15.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.sp),
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                )
              : Container(),
          CustomButton.h2(
            title: _controller.value.isPlaying ? "pause" : "play",
            onPressed: () {
              setState(() {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              });
            },
          ),
          SizedBox(height: 200.h),
          SizedBox(
            width: 150.w,
            height: 150.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.sp),
              child: Image.network(
                "https://cdn.techwireasia.com/wp-content/uploads/2018/04/shutterstock_617755883-e1522744540998.jpg",
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
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
        "Eye movement",
        style: theme.headline3,
      ),
      centerTitle: true,
      elevation: 0,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
