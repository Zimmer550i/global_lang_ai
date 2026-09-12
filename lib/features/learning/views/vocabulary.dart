import 'package:flutter/material.dart';
import 'package:global_lang_ai/core/utils/app_colors.dart';
import 'package:global_lang_ai/core/utils/app_texts.dart';
import 'package:global_lang_ai/core/utils/custom_svg.dart';
import 'package:global_lang_ai/core/widgets/custom_app_bar.dart';
import 'package:global_lang_ai/core/widgets/tts_widget.dart';

class Vocabulary extends StatelessWidget {
  const Vocabulary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Vocabulary"),
      body: SingleChildScrollView(
        padding: .symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 12),
              dailyGoal(),
              const SizedBox(height: 20),
              Container(
                padding: .all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: .circular(24),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        spacing: 4,
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            "Word of the Day",
                            style: AppTexts.bodyXlRegular.copyWith(
                              color: AppColors.black.shade300,
                            ),
                          ),
                          Row(
                            mainAxisSize: .min,
                            children: [
                              Text(
                                "Eloquent",
                                style: AppTexts.h4Semibold.copyWith(
                                  color: AppColors.blue.shade600,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const TtsWidget(text: "Eloquent", language: "bn"),
                            ],
                          ),
                          Text("/ˈel.ə.kwənt/", style: AppTexts.bodyMRegular),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: .circular(24),
                          border: Border.all(
                            color: AppColors.blue.shade200,
                            width: 0.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 20,
                              spreadRadius: -2,
                              color: Colors.black.withValues(alpha: 0.05),
                            ),
                          ],
                        ),
                        child: Center(
                          child: CustomSvg(asset: "assets/icons/share.svg"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: .all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: .circular(24),
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "MEANING",
                      style: AppTexts.buttonMMedium.copyWith(
                        color: AppColors.blue.shade600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Fluent or persuasive in speaking or writing; clearly expressing or indicating something.",
                      style: AppTexts.bodyXlRegular,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "SYNONYMS",
                      style: AppTexts.buttonMMedium.copyWith(
                        color: AppColors.green.shade600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      [
                        "Articulate",
                        "Fluent",
                        "Persuasive",
                        "Silver-tongued",
                      ].join(", "),
                      style: AppTexts.bodyXlRegular,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "EXAMPLE",
                      style: AppTexts.buttonMMedium.copyWith(
                        color: AppColors.green.shade600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: AppColors.blue.shade50,
                          border: Border(
                            left: BorderSide(
                              width: 4,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        child: Text(
                          "\"The speaker's eloquent defense of the new policy swayed even the most skeptical members of the audience.\"",
                          style: AppTexts.bodyLRegular,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Recent Words", style: AppTexts.bodyXlRegular),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: .start,
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    for (var i in ["Diligent", "Innate", "Banana", "Potato"])
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 28,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 0.5,
                            color: AppColors.black.shade100,
                          ),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Text(i, style: AppTexts.bodyLRegular),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stack dailyGoal() {
    return Stack(
      children: [
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
          child: Row(
            children: [
              CustomSvg(asset: "assets/icons/energy.svg"),
              const SizedBox(width: 12),
              Text(
                "DAILY GOAL",
                style: AppTexts.buttonSMedium.copyWith(color: Colors.white),
              ),
              const SizedBox(width: 20),
              Row(
                spacing: 4,
                crossAxisAlignment: .end,
                children: [
                  Text(
                    "8",
                    style: AppTexts.displayMBold.copyWith(color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Text(
                      "/ 10 words",
                      style: AppTexts.bodyXllRegular.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: -14,
          right: -48,
          child: Container(
            height: 160,
            width: 160,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              shape: .circle,
            ),
          ),
        ),
      ],
    );
  }
}
