import 'package:flutter/material.dart';
import 'package:global_lang_ai/core/utils/app_colors.dart';
import 'package:global_lang_ai/core/utils/app_texts.dart';

class UsageMetrics extends StatelessWidget {
  const UsageMetrics({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .symmetric(horizontal: 24, vertical: 20),
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
        spacing: 12,
        crossAxisAlignment: .start,
        children: [
          Text("Usages Metrics", style: AppTexts.h5Semibold),
          Container(
            width: double.infinity,
            height: 1,
            color: AppColors.black.shade50,
          ),
          metrics(
            "Characters Translated",
            "428k / 500k",
            0.6,
            AppColors.yellow,
          ),
          metrics(
            "Characters Translated",
            "428k / 500k",
            0.6,
            AppColors.primary,
          ),
          metrics("Characters Translated", "428k / 500k", 0.6, AppColors.error),
        ],
      ),
    );
  }

  Widget metrics(String name, String status, double val, Color color) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Text(name)),
            Text(status),
          ],
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: val,
          color: color,
          backgroundColor: AppColors.black.shade50,
          borderRadius: .circular(99),
        ),
      ],
    );
  }
}
