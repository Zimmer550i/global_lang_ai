import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_lang_ai/core/utils/app_texts.dart';
import 'package:global_lang_ai/core/widgets/custom_app_bar.dart';
import 'package:global_lang_ai/core/widgets/custom_button.dart';
import 'package:global_lang_ai/core/widgets/custom_text_field.dart';
import 'package:global_lang_ai/features/profile/controllers/support_controller.dart';
import 'package:global_lang_ai/features/profile/widgets/image_uploader.dart';

class ContactSupport extends StatelessWidget {
  const ContactSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Support"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Obx(() {
          final controller = Get.find<SupportController>();

          return SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20),
                CustomTextField(
                  title: "Opinion / Report / Problem",
                  hintText: "Explain your problem here",
                  lines: 5,
                  radius: 12,
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Attachment", style: AppTexts.bodyLRegular),
                ),
                const SizedBox(height: 8),
                ImageUploader(
                  image: controller.pickedImage.value,
                  onChange: (val) {
                    controller.pickedImage.value = val;
                  },
                ),
                Spacer(),
                CustomButton(
                  text: "Submit",
                  isLoading: controller.isLoading.value,
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        }),
      ),
    );
  }
}
