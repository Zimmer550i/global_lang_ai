import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_lang_ai/core/utils/app_colors.dart';
import 'package:global_lang_ai/core/utils/app_texts.dart';
import 'package:global_lang_ai/core/widgets/custom_app_bar.dart';
import 'package:global_lang_ai/core/widgets/custom_button.dart';
import 'package:global_lang_ai/core/widgets/logo.dart';
import 'package:global_lang_ai/features/profile/views/info.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  String? selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Subscription Packages"),
      body: Padding(
        padding: .symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: .center,
            children: [
              Logo(),
              const SizedBox(height: 32),
              Text("Unlock Everything", style: AppTexts.h4Semibold),
              const SizedBox(height: 8),
              Text(
                "Choose the plan that best fits your needs.",
                style: AppTexts.bodyXlRegular.copyWith(
                  color: AppColors.black.shade300,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: .all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: .circular(20),
                ),
                child: Column(
                  spacing: 32,
                  children: [
                    plan("Free Plan", "--", isCurrent: true),
                    plan("Monthly Plan", "\$29.99/month"),
                    plan("Yearly Plan", "\$299.99/month", isBestDeal: true),
                  ],
                ),
              ),

              Spacer(),
              Text(
                "Cancel Anytime, Auto Renewable",
                style: AppTexts.bodyMRegular.copyWith(
                  color: AppColors.black.shade300,
                ),
              ),
              const SizedBox(height: 12),
              CustomButton(text: "Subscribe"),
              const SizedBox(height: 12),
              Row(
                spacing: 12,
                mainAxisSize: .min,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => Info(title: "Terms & Services"));
                    },
                    child: Text(
                      "Terms & Services",
                      style: AppTexts.bodyLRegular.copyWith(
                        color: AppColors.black.shade300,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => Info(title: "Privacy Policy"));
                    },
                    child: Text(
                      "Privacy Policy",
                      style: AppTexts.bodyLRegular.copyWith(
                        color: AppColors.black.shade300,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget plan(
    String name,
    String price, {
    bool isBestDeal = false,
    bool isCurrent = false,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (selected == name) {
            selected = null;
          } else {
            selected = name;
          }
        });
      },
      child: Stack(
        clipBehavior: .none,
        children: [
          Container(
            padding: .symmetric(horizontal: 32, vertical: 16),
            decoration: BoxDecoration(
              borderRadius: .circular(24),
              color: selected == name
                  ? AppColors.yellow.shade100
                  : AppColors.blue.shade50,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: AppTexts.bodyXlRegular.copyWith(
                      color: AppColors.black.shade400,
                    ),
                  ),
                ),
                Text(
                  price,
                  style: AppTexts.bodyMMedium.copyWith(
                    color: AppColors.black.shade400,
                  ),
                ),
              ],
            ),
          ),
          if (isCurrent)
            Positioned(
              top: -20,
              right: -10,
              child: Center(
                child: Container(
                  padding: .symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.blue.shade600,
                    borderRadius: .circular(99),
                  ),
                  child: Text(
                    "Current",
                    style: AppTexts.buttonSMedium.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          if (isBestDeal && !isCurrent)
            Positioned(
              top: -20,
              right: -10,
              child: Container(
                padding: .symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: .circular(99),
                ),
                child: Text(
                  "Best Deal",
                  style: AppTexts.buttonSMedium.copyWith(color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
