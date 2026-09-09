import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_lang_ai/core/utils/app_colors.dart';
import 'package:global_lang_ai/core/utils/app_texts.dart';
import 'package:global_lang_ai/core/widgets/custom_app_bar.dart';
import 'package:global_lang_ai/core/widgets/custom_button.dart';
import 'package:global_lang_ai/core/widgets/custom_text_field.dart';
import 'package:global_lang_ai/features/auth/controllers/auth_controller.dart';
import 'package:global_lang_ai/features/auth/views/verification.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  void onSubmit() async {
    Get.to(() => Verification(isResettingPass: true));
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();

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
                  CustomTextField(
                    controller: controller.emailController,
                    title: "Email Address",
                    hintText: "name@company.com",
                    leading: "assets/icons/email.svg",
                  ),
                  const SizedBox(height: 32),
                  Obx(
                    () => CustomButton(
                      onTap: onSubmit,
                      isLoading: controller.isLoading.value,
                      text: "Send OTP",
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    spacing: 16,
                    children: [
                      Expanded(child: Divider()),
                      Text(
                        "OR",
                        style: AppTexts.bodyLRegular.copyWith(
                          color: AppColors.black.shade300,
                        ),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      text: "Remember your password? ",
                      style: AppTexts.bodyLRegular,
                      children: [
                        TextSpan(
                          text: "Back to Sign In",
                          style: AppTexts.bodyLRegular.copyWith(
                            color: AppColors.blue,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.back();
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
        Center(child: Image.asset("assets/images/forgot_pass.png", height: 90)),
        const SizedBox(height: 24),
        Text("Forgot Password", style: AppTexts.h4Semibold),
        const SizedBox(height: 4),
        Text(
          "Don't worry! Enter your registered email address and we'll send you a secure password reset link.",
          style: AppTexts.bodyLRegular.copyWith(
            color: AppColors.black.shade300,
          ),
        ),
      ],
    );
  }
}
