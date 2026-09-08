import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_lang_ai/core/utils/app_colors.dart';
import 'package:global_lang_ai/core/utils/app_texts.dart';
import 'package:global_lang_ai/core/widgets/custom_button.dart';
import 'package:global_lang_ai/core/widgets/custom_drop_down.dart';
import 'package:global_lang_ai/core/widgets/logo.dart';
import 'package:global_lang_ai/features/auth/views/authentication.dart';

class LanguageSelection extends StatelessWidget {
  const LanguageSelection({super.key});

  void onSubmit() async {
    Get.to(() => Authentication());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 100),
              Logo(),
              const SizedBox(height: 20),
              Text(
                "Welcome to GlobalLang AI",
                textAlign: .center,
                style: AppTexts.h4Semibold,
              ),
              const SizedBox(height: 8),
              Text(
                "Please select your preferred language",
                textAlign: .center,
                style: AppTexts.bodyXlRegular.copyWith(
                  color: AppColors.black.shade300,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: .circular(24),
                ),
                child: CustomDropDown(
                  title: "Select Language",
                  options: ["English"],
                  initialPick: 0,
                ),
              ),
              Spacer(),
              CustomButton(onTap: onSubmit, text: "Continue"),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
