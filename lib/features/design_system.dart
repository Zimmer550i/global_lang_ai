import 'dart:io';
import 'package:get/get.dart';
import 'package:global_lang_ai/core/utils/custom_list_handler.dart';
import 'package:global_lang_ai/core/widgets/custom_bottom_navbar.dart';
import 'package:global_lang_ai/core/widgets/custom_drop_down.dart';
import 'package:global_lang_ai/core/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:global_lang_ai/core/widgets/custom_app_bar.dart';
import 'package:global_lang_ai/core/widgets/custom_button.dart';
import 'package:global_lang_ai/core/widgets/custom_text_field.dart';
import 'package:global_lang_ai/core/widgets/overlay_confirmation.dart';
import 'package:global_lang_ai/core/widgets/profile_picture.dart';

class DesignSystem extends StatefulWidget {
  const DesignSystem({super.key});

  @override
  State<DesignSystem> createState() => _DesignSystemState();
}

class _DesignSystemState extends State<DesignSystem> {
  File? _image;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Design System"),
      bottomNavigationBar: CustomBottomNavbar(
        index: index,
        onChanged: (val) {
          setState(() {
            index = val;
          });
        },
      ),
      body: CustomListHandler(
        spacing: 20,
        children: [
          const SizedBox(),
          Logo(showName: true),
          const SizedBox(),
          ProfilePicture(
            imageFile: _image,
            image: "https://picsum.photos/500/500",
            imagePickerCallback: (val) {
              setState(() {
                _image = val;
              });
            },
            isEditable: true,
          ),
          const SizedBox(),
          CustomTextField(title: "Email", hintText: "Enter your email"),
          CustomTextField(
            title: "Password",
            hintText: "Enter your password",
            isPassword: true,
          ),
          CustomDropDown(options: ["Option 1", "Option 2"], title: "Option"),
          const SizedBox(),
          CustomButton(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => OverlayConfirmation(
                  title: "This is a Design Sytem. Are you",
                  highlight: "Dumb?",
                  buttonTextLeft: "Yes",
                  buttonCallBackLeft: () {
                    Get.back();
                  },
                  buttonTextRight: "Obviously",
                  buttonCallBackRight: () {
                    Get.back();
                  },
                ),
              );
            },
            text: "Primary Button",
          ),
          CustomButton(text: "Secondary Button", isSecondary: true),
          CustomButton(text: "Disabled Button", isDisabled: true),
        ],
      ),
    );
  }
}
