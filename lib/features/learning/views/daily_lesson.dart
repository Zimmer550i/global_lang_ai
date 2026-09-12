import 'package:flutter/material.dart';
import 'package:global_lang_ai/core/utils/app_colors.dart';
import 'package:global_lang_ai/core/utils/app_texts.dart';
import 'package:global_lang_ai/core/utils/formatter.dart';
import 'package:global_lang_ai/core/widgets/custom_app_bar.dart';
import 'package:global_lang_ai/features/learning/widgets/lesson_widget.dart';

class DailyLesson extends StatelessWidget {
  const DailyLesson({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Daily Lesson"),
      body: SingleChildScrollView(
        padding: .symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              const SizedBox(height: 20),
              Container(
                padding: .all(20),
                decoration: BoxDecoration(
                  borderRadius: .circular(24),
                  color: AppColors.primary,
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
                  spacing: 12,
                  crossAxisAlignment: .start,
                  children: [
                    Container(
                      padding: .symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.blue.shade400,
                        borderRadius: .circular(99),
                      ),
                      child: Text(
                        "DAILY CHALLENGE",
                        style: AppTexts.bodyMRegular.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      "The 10-Minute Fluency Sprint",
                      style: AppTexts.h4Semibold.copyWith(
                        color: Colors.white,
                        height: 1,
                      ),
                    ),
                    Text(
                      "Ends in ${Formatter.countdownLong(Duration(hours: 2, minutes: 52, seconds: 5))}",
                      style: AppTexts.bodyXlRegular.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(),
                    Container(
                      height: 52,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: .circular(24),
                      ),
                      child: Center(
                        child: Text(
                          "Start Challenge",
                          style: AppTexts.bodyXlRegular,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Recomended Lessons", style: AppTexts.h6Semibold),
              ),
              const SizedBox(height: 12),
              Column(
                spacing: 12,
                children: [for (int i = 0; i < 2; i++) LessonWidget()],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
