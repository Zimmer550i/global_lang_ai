import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_lang_ai/core/models/cliclable_button_model.dart';
import 'package:global_lang_ai/core/utils/app_colors.dart';
import 'package:global_lang_ai/core/utils/app_texts.dart';
import 'package:global_lang_ai/core/utils/custom_svg.dart';
import 'package:global_lang_ai/core/widgets/custom_app_bar.dart';
import 'package:global_lang_ai/features/home/views/history.dart';
import 'package:global_lang_ai/features/home/views/notifications.dart';
import 'package:global_lang_ai/features/home/widgets/progression.dart';
import 'package:global_lang_ai/features/profile/views/profile.dart';

/*
   * For whoever continues working on this project: 
   * 
   * 
   * 
  */

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<CliclableButtonModel> quickActions = [
    CliclableButtonModel(iconName: "language", title: "Translate"),
    CliclableButtonModel(iconName: "writing", title: "Ai Writing"),
    CliclableButtonModel(iconName: "mic", title: "Voice"),
    CliclableButtonModel(iconName: "document", title: "Documents"),
    CliclableButtonModel(iconName: "chat", title: "AI Chat"),
    CliclableButtonModel(iconName: "learning", title: "Learning"),
  ];

  final List<CliclableButtonModel> workFlowShortcuts = [
    CliclableButtonModel(iconName: "email", title: "Translate Email"),
    CliclableButtonModel(iconName: "voice_to_text", title: "Voice-to-Text"),
    CliclableButtonModel(iconName: "summerize_doc", title: "Summarize Doc"),
    CliclableButtonModel(iconName: "legal_review", title: "Legal Review"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        hasLeading: false,
        actions: [
          CliclableButtonModel(
            iconName: "history",
            onTap: () {
              Get.to(() => History());
            },
          ),
          CliclableButtonModel(
            iconName: "bell",
            onTap: () {
              Get.to(() => Notifications());
            },
          ),
          CliclableButtonModel(
            iconName: "user",
            onTap: () {
              Get.to(() => Profile());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: .symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              const SizedBox(height: 8),
              Progression(),
              const SizedBox(height: 20),
              Text("Quick Actions", style: AppTexts.h6Semibold),
              const SizedBox(height: 12),
              Row(
                spacing: 12,
                children: [
                  quickActionButton(quickActions[0]),
                  quickActionButton(quickActions[1]),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                spacing: 12,
                children: [
                  quickActionButton(quickActions[2]),
                  quickActionButton(quickActions[3]),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                spacing: 12,
                children: [
                  quickActionButton(quickActions[4]),
                  quickActionButton(quickActions[5]),
                ],
              ),
              const SizedBox(height: 20),
              Text("Work Flow  Shortcut", style: AppTexts.h6Semibold),
              const SizedBox(height: 12),
              for (var i in workFlowShortcuts) workFlowShortcut(i),
            ],
          ),
        ),
      ),
    );
  }

  Widget quickActionButton(CliclableButtonModel button) {
    return Expanded(
      child: GestureDetector(
        onTap: button.onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: .circular(24),
            border: Border.all(color: AppColors.blue.shade200, width: 0.5),
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
                  border: .all(color: AppColors.blue.shade100, width: 0.4),
                ),
                child: Center(
                  child: CustomSvg(
                    asset: "assets/icons/${button.iconName}.svg",
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                button.title ?? "",
                style: AppTexts.bodyXlRegular.copyWith(
                  color: AppColors.black.shade300,
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget workFlowShortcut(CliclableButtonModel button) {
    return GestureDetector(
      onTap: button.onTap,
      child: Container(
        padding: .symmetric(horizontal: 20, vertical: 16),
        margin: .only(bottom: 12),
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
        child: Row(
          spacing: 16,
          children: [
            Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                shape: .circle,
                border: .all(color: AppColors.black.shade100, width: 0.4),
              ),
              child: Center(
                child: CustomSvg(
                  asset: "assets/icons/${button.iconName}.svg",
                  size: 24,
                  color: AppColors.black.shade300,
                ),
              ),
            ),
            Expanded(
              child: Text(
                button.title ?? "",
                style: AppTexts.bodyXlRegular.copyWith(
                  color: AppColors.black.shade300,
                ),
              ),
            ),
            CustomSvg(
              asset: "assets/icons/arrow_forward.svg",
              size: 24,
              color: AppColors.black.shade300,
            ),
          ],
        ),
      ),
    );
  }
}
