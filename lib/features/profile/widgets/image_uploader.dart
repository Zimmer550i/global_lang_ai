import 'dart:io';
import 'package:flutter/material.dart';
import 'package:global_lang_ai/core/utils/app_colors.dart';
import 'package:global_lang_ai/core/utils/app_texts.dart';
import 'package:global_lang_ai/core/utils/custom_image_picker.dart';
import 'package:global_lang_ai/core/utils/custom_svg.dart';

class ImageUploader extends StatelessWidget {
  final File? image;
  final void Function(File?) onChange;
  const ImageUploader({super.key, this.image, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.width / 3,
        maxHeight: MediaQuery.of(context).size.width / 1.5,
      ),
      padding: const EdgeInsets.symmetric(vertical: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        image: image != null ? DecorationImage(image: FileImage(image!)) : null,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.black.shade200,
          style: BorderStyle.solid,
        ),
      ),
      child: image == null
          ? Column(
              mainAxisSize: .min,
              mainAxisAlignment: .center,
              children: [
                GestureDetector(
                  onTap: () async {
                    final picked = await customImagePicker(
                      isCircular: false,
                      isSquared: false,
                    );

                    onChange(picked);
                  },
                  child: CustomSvg(asset: "assets/icons/upload.svg"),
                ),
                const SizedBox(height: 16),
                Text("Click here to upload", style: AppTexts.bodyLRegular),
              ],
            )
          : Container(),
    );
  }
}
