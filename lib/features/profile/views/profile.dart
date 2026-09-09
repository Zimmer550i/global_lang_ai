import 'package:flutter/material.dart';
import 'package:global_lang_ai/core/utils/app_colors.dart';
import 'package:global_lang_ai/core/utils/app_texts.dart';
import 'package:global_lang_ai/core/utils/custom_svg.dart';
import 'package:global_lang_ai/core/widgets/custom_app_bar.dart';
import 'package:global_lang_ai/core/widgets/custom_button.dart';
import 'package:global_lang_ai/core/widgets/profile_picture.dart';
import 'package:global_lang_ai/features/profile/widgets/usage_metrics.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Profile"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            children: [
              ProfilePicture(image: "https://picsum.photos/200/200"),
              const SizedBox(height: 8),
              Text("Alex Johnson", style: AppTexts.h4Semibold),
              const SizedBox(height: 4),
              Text(
                "alex.johnson@gmail.com",
                style: AppTexts.bodyLRegular.copyWith(
                  color: AppColors.black.shade300,
                ),
              ),
              const SizedBox(height: 16),
              UsageMetrics(),
              const SizedBox(height: 16),
              Container(
                padding: .all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: .circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 20,
                      spreadRadius: -2,
                      color: Colors.black.withValues(alpha: 0.05),
                    ),
                  ],
                ),
                child: Column(
                  spacing: 8,
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "Account",
                      style: AppTexts.bodyLRegular.copyWith(
                        color: AppColors.black.shade300,
                      ),
                    ),

                    menuOptions(iconName: "user", title: "Edit Profile Setup"),
                    menuOptions(iconName: "globe", title: "Change Language"),
                    menuOptions(iconName: "plan", title: "Subscription Plan"),
                    menuOptions(
                      iconName: "bell",
                      title: "Receive Notification Via Email",
                      action: Switch(
                        value: true,
                        padding: .all(0),
                        activeTrackColor: AppColors.blue,
                        inactiveTrackColor: AppColors.black.shade50,
                        onChanged: (val) {},
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: .all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: .circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 20,
                      spreadRadius: -2,
                      color: Colors.black.withValues(alpha: 0.05),
                    ),
                  ],
                ),
                child: Column(
                  spacing: 8,
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "Support",
                      style: AppTexts.bodyLRegular.copyWith(
                        color: AppColors.black.shade300,
                      ),
                    ),

                    menuOptions(
                      iconName: "faq",
                      title: "Frequently Asked Questions",
                    ),
                    menuOptions(iconName: "support", title: "Contact Support"),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: .all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: .circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 20,
                      spreadRadius: -2,
                      color: Colors.black.withValues(alpha: 0.05),
                    ),
                  ],
                ),
                child: Column(
                  spacing: 8,
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "Legal",
                      style: AppTexts.bodyLRegular.copyWith(
                        color: AppColors.black.shade300,
                      ),
                    ),

                    menuOptions(iconName: "logo", title: "About GobalLang AI"),
                    menuOptions(iconName: "privacy", title: "Privacy Policy"),
                    menuOptions(iconName: "terms", title: "Terms & Services"),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              CustomButton(text: "Delete Account", isSecondary: true),
              const SizedBox(height: 16),
              CustomButton(text: "Log Out"),
            ],
          ),
        ),
      ),
    );
  }

  Widget menuOptions({
    required String iconName,
    required String title,
    void Function()? onTap,
    Widget? action,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 32,
        child: Row(
          spacing: 12,
          children: [
            CustomSvg(asset: "assets/icons/$iconName.svg", size: 24),
            Expanded(
              child: Text(
                title,
                style: AppTexts.bodyLRegular.copyWith(
                  color: AppColors.black.shade300,
                ),
              ),
            ),
            if (action == null)
              CustomSvg(asset: "assets/icons/arrow_forward.svg", size: 24),
            ?action,
          ],
        ),
      ),
    );
  }
}
