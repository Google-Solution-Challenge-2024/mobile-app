import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solution_app/core/config/custom_theme_extension.dart';
import 'package:solution_app/core/service-locator/service_locator_manager.dart';
import 'package:solution_app/core/ui/button/custom_button.dart';
import 'package:solution_app/navigation/auth_navigation.dart';

class GameResultPage extends StatefulWidget {
  final bool isWin;
  const GameResultPage({super.key, required this.isWin});

  @override
  State<GameResultPage> createState() => _GameResultPageState();
}

class _GameResultPageState extends State<GameResultPage> {
  late ConfettiController _controllerCenter;

  @override
  void initState() {
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    if (widget.isWin) {
      _controllerCenter.play();
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controllerCenter.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConfettiWidget(
      confettiController: _controllerCenter,
      blastDirectionality: BlastDirectionality.explosive,
      shouldLoop: true,
      child: Scaffold(
        body: widget.isWin ? _buildWinCase() : _buildLostCase(),
      ),
    );
  }

  Widget _buildWinCase() {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Row(),
        Text(
          "You won! Congratulations!",
          style: theme.headline1.copyWith(
            fontSize: 27.sp,
          ),
        ),
        SizedBox(height: 30.h),
        CustomButton.h2(
            title: "Close",
            onPressed: () {
              globalSL<AuthNavigation>()
                  .globalRouter
                  .pushReplacement(AuthNavigation.home);
            })
      ],
    );
  }

  Widget _buildLostCase() {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Row(),
        Text(
          "You lost! Don't be sad! Try again!",
          style: theme.headline1.copyWith(
            fontSize: 27.sp,
          ),
        ),
        SizedBox(height: 30.h),
        CustomButton.h2(
            title: "Close",
            onPressed: () {
              globalSL<AuthNavigation>()
                  .globalRouter
                  .pushReplacement(AuthNavigation.home);
            })
      ],
    );
  }
}
