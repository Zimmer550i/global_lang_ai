import 'package:flutter/material.dart';
import 'package:global_lang_ai/core/utils/app_colors.dart';
import 'package:global_lang_ai/core/utils/app_texts.dart';
import 'package:global_lang_ai/core/widgets/custom_app_bar.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({super.key});

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Change Language"),
      body: Padding(
        padding: .symmetric(horizontal: 20),
        child: Container(
          padding: .all(16),
          margin: .only(top: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: .circular(20),
          ),
          child: Column(
            mainAxisSize: .min,
            spacing: 12,
            children: [
              options("English", 0),
              options("German", 1),
              options("Bangla", 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget options(String title, int pos) {
    final isSelected = pos == selected;
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = pos;
        });
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.green.shade50 : AppColors.blue.shade50,
          borderRadius: .circular(24),
        ),
        child: Text(title, style: AppTexts.bodyXlRegular),
      ),
    );
  }
}
