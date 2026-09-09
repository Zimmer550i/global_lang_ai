import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_lang_ai/core/utils/app_colors.dart';
import 'package:global_lang_ai/core/utils/app_texts.dart';
import 'package:global_lang_ai/core/widgets/custom_app_bar.dart';
import 'package:global_lang_ai/core/widgets/custom_button.dart';
import 'package:global_lang_ai/features/auth/controllers/auth_controller.dart';
import 'package:global_lang_ai/features/auth/controllers/startup_controller.dart';
import 'package:global_lang_ai/features/auth/views/change_password.dart';
import 'package:pinput/pinput.dart';

class Verification extends StatefulWidget {
  final bool isResettingPass;
  const Verification({super.key, this.isResettingPass = false});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final controller = Get.find<AuthController>();
  final _focusNode = FocusNode();
  Timer? timer;
  bool canResend = true;
  int seconds = -1;

  void onSubmit() async {
    if (widget.isResettingPass) {
      Get.to(() => ChangePassword());
    } else {
      Get.find<StartupController>().goToHome();
    }
  }

  void resendOTP() async {
    resetTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            header(),
            const SizedBox(height: 24),
            Container(
              padding: .symmetric(horizontal: 20, vertical: 32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: .circular(24),
              ),
              child: Column(
                children: [
                  Pinput(
                    controller: controller.otpController,
                    length: 6,
                    focusNode: _focusNode,
                    defaultPinTheme: PinTheme(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: AppColors.blue.shade50,
                        shape: .circle,
                        border: .all(
                          color: AppColors.blue.shade100,
                          width: 0.5,
                        ),
                      ),
                    ),
                    focusedPinTheme: PinTheme(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        color: AppColors.blue.shade50,
                        shape: .circle,
                        border: .all(color: AppColors.blue, width: 0.5),
                      ),
                    ),
                    onTapOutside: (event) => _focusNode.unfocus(),
                  ),
                  const SizedBox(height: 32),
                  Obx(
                    () => CustomButton(
                      onTap: onSubmit,
                      isLoading: controller.isLoading.value,
                      text: "Verify",
                    ),
                  ),
                  const SizedBox(height: 32),
                  RichText(
                    text: TextSpan(
                      text: "Didn't receive the code? ",
                      style: AppTexts.bodyLRegular,
                      children: [
                        if (!canResend)
                          TextSpan(
                            text:
                                "Resend in 00:${seconds.toString().padLeft(2, '0')}",
                          ),
                        if (canResend)
                          TextSpan(
                            text: "Resend",
                            style: AppTexts.bodyLRegular.copyWith(
                              color: AppColors.blue,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                resendOTP();
                              },
                          ),
                      ],
                    ),
                  ),
                  // const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column header() {
    return Column(
      crossAxisAlignment: .start,
      children: [
        const SizedBox(height: 20),
        Center(child: Image.asset("assets/images/otp.png", height: 90)),
        const SizedBox(height: 24),
        Text("OTP Verification", style: AppTexts.h4Semibold),
        const SizedBox(height: 4),
        Text(
          "We've sent a 6-digit verification code to your registered email address. Enter the code below to continue.",
          style: AppTexts.bodyLRegular.copyWith(
            color: AppColors.black.shade300,
          ),
        ),
      ],
    );
  }

  void resetTimer() async {
    setState(() {
      canResend = false;
      seconds = 10;
    });
    timer = Timer.periodic(Duration(seconds: 1), (val) {
      setState(() {
        seconds--;
      });
      if (seconds < 0) {
        val.cancel();
        timer = null;
        setState(() {
          canResend = true;
        });
      }
    });
  }
}
