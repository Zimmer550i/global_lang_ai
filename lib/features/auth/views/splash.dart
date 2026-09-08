import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_lang_ai/core/utils/app_colors.dart';
import 'package:global_lang_ai/core/widgets/logo.dart';
import 'package:global_lang_ai/features/auth/controllers/startup_controller.dart';
import 'package:motor/motor.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final splashController = Get.find<StartupController>();

  @override
  void initState() {
    super.initState();
    splashController.verifyToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: SafeArea(
        child: Column(
          children: [
            Spacer(),
            Logo(showName: true, isWhite: true),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SingleMotionBuilder(
                  motion: Motion.cupertino(
                    duration: splashController.splashTimeDefault,
                  ),
                  value: 1,
                  from: 0,
                  builder: (context, value, child) {
                    return CircularProgressIndicator(
                      value: value,
                      color: Colors.white,
                      strokeWidth: (value * 3) + 2,
                      backgroundColor: AppColors.blue.shade100,
                      strokeCap: .round,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
