import 'package:flutter/material.dart';
import 'package:global_lang_ai/core/utils/app_colors.dart';
import 'package:global_lang_ai/core/utils/app_texts.dart';
import 'package:global_lang_ai/core/utils/custom_svg.dart';
import 'package:global_lang_ai/core/utils/formatter.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: .circular(24),
      ),
      child: Column(
        spacing: 8,
        crossAxisAlignment: .start,
        children: [
          Row(
            spacing: 8,
            crossAxisAlignment: .start,
            children: [
              CustomSvg(asset: "assets/icons/language.svg", size: 24),
              Expanded(
                child: Column(
                  spacing: 4,
                  crossAxisAlignment: .start,
                  children: [
                    Text("Action Title", style: AppTexts.buttonSMedium),
                    Text(
                      "Your Premium subscription has been renewed.",
                      style: AppTexts.bodyMMedium.copyWith(
                        color: AppColors.black.shade300,
                      ),
                    ),
                    Text(
                      Formatter.durationFormatter(
                        DateTime.now().difference(
                          DateTime.now().subtract(Duration(days: 1)),
                        ),
                      ),
                      style: AppTexts.bodyMMedium.copyWith(
                        color: AppColors.blue.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: CustomSvg(asset: "assets/icons/delete.svg"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
