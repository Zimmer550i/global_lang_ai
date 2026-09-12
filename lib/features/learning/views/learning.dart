import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_lang_ai/core/models/cliclable_button_model.dart';
import 'package:global_lang_ai/core/utils/app_colors.dart';
import 'package:global_lang_ai/core/utils/app_texts.dart';
import 'package:global_lang_ai/core/utils/custom_svg.dart';
import 'package:global_lang_ai/core/widgets/custom_app_bar.dart';
import 'package:global_lang_ai/features/home/views/history.dart';
import 'package:global_lang_ai/features/learning/views/daily_lesson.dart';
import 'package:global_lang_ai/features/learning/views/vocabulary.dart';
import 'package:global_lang_ai/features/learning/widgets/lesson_widget.dart';

/*
  * For whoever continues working on this project:
  * 
  * This app's design is ass. Utter bullshit.
  * I think best approch at this stage would be to recreate
  * the design and app flow by at least thinking of what will be it's 
  * implementation. 
  * 
  * Especially this section is full of widgets without any purpose.
  * If you face any problem. Please contact your designer and team leader.
  * I tried to make this whole project as easy as possible 
  * for the next Developer
  */

class Learning extends StatefulWidget {
  const Learning({super.key});

  @override
  State<Learning> createState() => _LearningState();
}

class _LearningState extends State<Learning> {
  final List<CliclableButtonModel> buttons = [
    CliclableButtonModel(iconName: "grammer", title: "Grammer"),
    CliclableButtonModel(
      iconName: "vocabulary_2",
      title: "Vocabulary",
      onTap: () {
        Get.to(() => Vocabulary());
      },
    ),
    CliclableButtonModel(iconName: "voice_to_text", title: "Pronunciation"),
    CliclableButtonModel(
      iconName: "daily_lession",
      title: "Daily Lesson",
      onTap: () {
        Get.to(() => DailyLesson());
      },
    ),
    CliclableButtonModel(iconName: "progress", title: "Progress Tracking"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Learning",
        actions: [
          CliclableButtonModel(
            iconName: "history",
            onTap: () {
              Get.to(() => History());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: .symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                spacing: 12,
                children: [iconButtons(buttons[0]), iconButtons(buttons[1])],
              ),
              const SizedBox(height: 12),
              Row(
                spacing: 12,
                children: [iconButtons(buttons[2]), iconButtons(buttons[3])],
              ),
              const SizedBox(height: 12),
              Row(spacing: 12, children: [iconButtons(buttons[4])]),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Continue Lessons", style: AppTexts.h6Semibold),
              ),
              const SizedBox(height: 12),
              Column(
                spacing: 12,
                children: [
                  for (int i = 0; i < 2; i++)
                    LessonWidget(showObjective: false),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconButtons(CliclableButtonModel button) {
    return Expanded(
      child: GestureDetector(
        onTap: button.onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: .circular(24),
            // border: Border.all(color: AppColors.blue.shade200, width: 0.5),
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
            mainAxisAlignment: .spaceAround,
            children: [
              const SizedBox(height: 12),
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  shape: .circle,
                  color: AppColors.blue.shade50,
                  border: .all(color: AppColors.blue.shade100, width: 0.4),
                ),
                child: Center(
                  child: CustomSvg(
                    asset: "assets/icons/${button.iconName}.svg",
                    // size: 24,
                    color: AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                button.title ?? "",
                style: AppTexts.bodyXlRegular.copyWith(
                  color: AppColors.black.shade400,
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
