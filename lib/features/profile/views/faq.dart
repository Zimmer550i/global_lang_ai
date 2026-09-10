import 'package:flutter/material.dart';
import 'package:global_lang_ai/core/utils/app_texts.dart';
import 'package:global_lang_ai/core/widgets/custom_app_bar.dart';
import 'package:global_lang_ai/core/widgets/custom_button.dart';
import 'package:global_lang_ai/features/profile/widgets/faq_widget.dart';

class Faq extends StatefulWidget {
  const Faq({super.key});

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  int expendedWidget = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "FAQ"),
      body: Padding(
        padding: .symmetric(horizontal: 20),
        child: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Container(
                    padding: .all(16),
                    margin: EdgeInsets.only(top: 20, bottom: 120),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: .circular(20),
                    ),
                    child: Column(
                      spacing: 12,
                      children: [
                        for (int i = 0; i < 5; i++)
                          FaqWidget(
                            title: "Which languages does GlobalLang AI support?",
                            description:
                                "The platform currently supports English, Arabic, French, Spanish, and Hindi, with additional languages planned in future updates.",
                            isExpanded: i == expendedWidget,
                            onChanged: () {
                              setState(() {
                                if (expendedWidget == i) {
                                  expendedWidget = -1;
                                } else {
                                  expendedWidget = i;
                                }
                              });
                            },
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Text("Still need help?", style: AppTexts.bodyLRegular),
                  const SizedBox(height: 12),
                  SafeArea(child: CustomButton(text: "Contact Us")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
