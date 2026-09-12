import 'package:flutter/material.dart';
import 'package:global_lang_ai/core/utils/app_colors.dart';
import 'package:global_lang_ai/core/utils/app_texts.dart';
import 'package:global_lang_ai/core/widgets/custom_button.dart';
import 'package:global_lang_ai/core/widgets/profile_picture.dart';

class LessonWidget extends StatelessWidget {
  final bool showObjective;
  const LessonWidget({super.key, this.showObjective = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: .circular(24),
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
        crossAxisAlignment: .start,
        children: [
          Row(
            spacing: 16,
            children: [
              ProfilePicture(image: "https://picsum.photos/200/200", size: 78),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "Business English",
                      style: AppTexts.bodyXlRegular.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Master corporate…",
                      style: AppTexts.bodyLRegular.copyWith(
                        color: AppColors.black.shade300,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (showObjective)
            Column(
              spacing: 8,
              crossAxisAlignment: .start,
              children: [
                const SizedBox(height: 8),
                Text(
                  "OBJECTIVES",
                  style: AppTexts.bodyXlRegular.copyWith(
                    color: AppColors.black.shade300,
                  ),
                ),
                for (int i = 0; i < 2; i++)
                  Row(
                    spacing: 8,
                    children: [
                      Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                          shape: .circle,
                          color: AppColors.primary,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Differentiating \"Pretérito\" vs \"Imperfecto\"",
                          style: AppTexts.bodyXlRegular,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Progress",
                  style: AppTexts.bodyXlRegular.copyWith(
                    color: AppColors.black.shade300,
                  ),
                ),
              ),
              Text(
                "67%",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: .w700,
                  color: AppColors.primary,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: 0.67,
            borderRadius: .circular(99),
            color: AppColors.primary,
            backgroundColor: AppColors.blue.shade100,
          ),
          const SizedBox(height: 24),
          CustomButton(text: "Continue"),
        ],
      ),
    );
  }
}
