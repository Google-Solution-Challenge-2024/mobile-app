import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:solution_app/core/config/custom_theme_extension.dart';
import 'package:solution_app/core/service-locator/service_locator_manager.dart';
import 'package:solution_app/core/ui/button/custom_button.dart';
import 'package:solution_app/navigation/auth_navigation.dart';

class HandTestPage extends StatefulWidget {
  const HandTestPage({super.key});

  @override
  State<HandTestPage> createState() => _HandTestPageState();
}

class _HandTestPageState extends State<HandTestPage> {
  XFile? galleryVideo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          const Row(),
          SizedBox(height: 200.h),
          CustomButton.h3(
            title: "Select video",
            height: 50.h,
            child: const Center(
              child: Icon(Icons.upload_file),
            ),
            onPressed: () {
              getVideo();
            },
          ),
          SizedBox(height: 300.h),
          CustomButton.h3(
            title: "Upload",
            height: 50.h,
            onPressed: () {
              globalSL<AuthNavigation>().globalRouter.pop();
              globalSL<AuthNavigation>().globalRouter.pop();
            },
          )
        ],
      ),
    );
  }

  Future getVideo() async {
    // final ImagePicker picker = ImagePicker();
    setState(() {});
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
        "Hand movement",
        style: theme.headline3,
      ),
      centerTitle: true,
      elevation: 0,
    );
  }
}
