import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_lang_ai/core/utils/app_colors.dart';
import 'package:global_lang_ai/core/utils/app_texts.dart';
import 'package:global_lang_ai/core/widgets/custom_app_bar.dart';
import 'package:global_lang_ai/core/widgets/custom_button.dart';
import 'package:global_lang_ai/core/widgets/custom_text_field.dart';
import 'package:global_lang_ai/features/auth/controllers/auth_controller.dart';
import 'package:global_lang_ai/features/auth/views/reset_password_confirmation.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  void onSubmit() async {
    Get.to(() => ResetPasswordConfirmation());
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
                    controller: controller.newPassController,
                    title: "New Password",
                    hintText: "••••••••",
                    leading: "assets/icons/lock.svg",
                    isPassword: true,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: controller.confirmPassController,
                    title: "Confirm Password",
                    hintText: "••••••••",
                    leading: "assets/icons/lock.svg",
                    isPassword: true,
                  ),
                  const SizedBox(height: 32),
                  Obx(
                    () => CustomButton(
                      onTap: onSubmit,
                      isLoading: controller.isLoading.value,
                      text: "Confirm",
                    ),
                  ),
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
        Center(child: Image.asset("assets/images/create_pass.png", height: 90)),
        const SizedBox(height: 24),
        Text("Create New Password", style: AppTexts.h4Semibold),
        const SizedBox(height: 4),
        Text(
          "Create a strong and secure password to protect your GlobalLang AI account.",
          style: AppTexts.bodyLRegular.copyWith(
            color: AppColors.black.shade300,
          ),
        ),
      ],
    );
  }
}
