import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_lang_ai/core/utils/app_colors.dart';
import 'package:global_lang_ai/core/utils/app_texts.dart';
import 'package:global_lang_ai/core/utils/custom_svg.dart';
import 'package:global_lang_ai/core/widgets/custom_app_bar.dart';
import 'package:global_lang_ai/core/widgets/custom_button.dart';

class ResetPasswordConfirmation extends StatelessWidget {
  const ResetPasswordConfirmation({super.key});

  void onSubmit() async {
    Get.back();
    Get.back();
    Get.back();
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Padding(
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
                    Container(
                      padding: .symmetric(horizontal: 24, vertical: 16),
                      decoration: BoxDecoration(
                        color: AppColors.green.shade50,
                        borderRadius: .circular(24),
                      ),
                      child: Row(
                        children: [
                          CustomSvg(asset: "assets/icons/confirmation.svg"),
                          Expanded(
                            child: Text(
                              "Your account is now protected with your new password.",
                              textAlign: .center,
                              style: AppTexts.bodyXlRegular.copyWith(
                                color: AppColors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    CustomButton(onTap: onSubmit, text: "Continue"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column header() {
    return Column(
      crossAxisAlignment: .center,
      children: [
        const SizedBox(height: 20),
        Center(child: Image.asset("assets/images/reset_pass.png", height: 90)),
        const SizedBox(height: 24),
        Text("Password Reset Successful", style: AppTexts.h4Semibold),
        const SizedBox(height: 4),
        RichText(
          textAlign: .center,
          text: TextSpan(
            text:
                "Your password has been updated successfully. You can now sign in with your new password and continue using ",
            style: AppTexts.bodyLRegular.copyWith(
              color: AppColors.black.shade300,
            ),
            children: [
              TextSpan(
                text: "GlobalLang AI ",
                style: AppTexts.bodyLRegular.copyWith(color: AppColors.blue),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
              TextSpan(text: "securely."),
            ],
          ),
        ),
      ],
    );
  }
}
