import 'package:flutter/material.dart';
import 'package:global_lang_ai/core/utils/app_colors.dart';
import 'package:global_lang_ai/core/utils/app_texts.dart';
import 'package:global_lang_ai/core/utils/custom_svg.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

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
            spacing: 12,
            children: [
              Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: .circle,
                ),
              ),
              Expanded(
                child: Text(
                  "Notification Title",
                  style: AppTexts.buttonSMedium,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: CustomSvg(asset: "assets/icons/close.svg"),
              ),
            ],
          ),
          Text(
            "Your Premium subscription has been renewed.",
            style: AppTexts.bodyMMedium.copyWith(
              color: AppColors.black.shade300,
            ),
          ),
        ],
      ),
    );
  }
}
