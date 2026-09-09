import 'package:flutter/material.dart';
import 'package:global_lang_ai/core/utils/app_colors.dart';
import 'package:global_lang_ai/core/utils/app_texts.dart';
import 'package:global_lang_ai/core/utils/custom_svg.dart';
import 'package:global_lang_ai/core/utils/formatter.dart';

class Progression extends StatelessWidget {
  const Progression({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: .circular(24),
      ),
      child: Row(
        children: [
          options("streak", "Daily Streak", "15 days"),
          options("vocabulary", "Vocabulary", Formatter.numberWithCommas(4100)),
          options("lession", "Lessons", "128"),
        ],
      ),
    );
  }

  Widget options(String iconName, String title, String value) {
    return Expanded(
      child: Column(
        spacing: 4,
        children: [
          CustomSvg(
            asset: "assets/icons/$iconName.svg",
            size: 24,
            color: Colors.white,
          ),
          Text(
            title,
            style: AppTexts.bodyLRegular.copyWith(color: Colors.white),
          ),
          Text(
            value,
            style: AppTexts.bodyMMedium.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
