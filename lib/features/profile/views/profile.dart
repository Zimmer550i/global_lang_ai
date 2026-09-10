import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_lang_ai/core/utils/app_colors.dart';
import 'package:global_lang_ai/core/utils/app_texts.dart';
import 'package:global_lang_ai/core/utils/custom_svg.dart';
import 'package:global_lang_ai/core/widgets/custom_app_bar.dart';
import 'package:global_lang_ai/core/widgets/custom_button.dart';
import 'package:global_lang_ai/core/widgets/overlay_confirmation.dart';
import 'package:global_lang_ai/features/auth/views/authentication.dart';
import 'package:global_lang_ai/features/profile/views/change_language.dart';
import 'package:global_lang_ai/features/profile/views/contact_support.dart';
import 'package:global_lang_ai/features/profile/views/faq.dart';
import 'package:global_lang_ai/features/profile/views/info.dart';
import 'package:global_lang_ai/features/profile/views/subscription.dart';
import 'package:global_lang_ai/features/profile/widgets/usage_metrics.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool recieveEmail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Profile"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            children: [
              // ProfilePicture(image: "https://picsum.photos/200/200"),
              // const SizedBox(height: 8),
              // Text("Alex Johnson", style: AppTexts.h4Semibold),
              // const SizedBox(height: 4),
              // Text(
              //   "alex.johnson@gmail.com",
              //   style: AppTexts.bodyLRegular.copyWith(
              //     color: AppColors.black.shade300,
              //   ),
              // ),
              Row(
                spacing: 16,
                children: [
                  // Container(
                  //   height: 72,
                  //   width: 72,
                  //   decoration: BoxDecoration(
                  //     shape: .circle,
                  //     color: Colors.white,
                  //   ),
                  //   child: Center(
                  //     child: CustomSvg(
                  //       asset: "assets/icons/user.svg",
                  //       size: 48,
                  //       color: AppColors.black.shade300,
                  //     ),
                  //   ),
                  // ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: .end,
                      children: [
                        EditableName(),
                        // const SizedBox(height: 4),
                        Text(
                          "alex.johnson@gmail.com",
                          style: AppTexts.bodyLRegular.copyWith(
                            color: AppColors.black.shade300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              UsageMetrics(),
              const SizedBox(height: 16),
              Container(
                padding: .all(12),
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
                  spacing: 8,
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "Account",
                      style: AppTexts.bodyLRegular.copyWith(
                        color: AppColors.black.shade300,
                      ),
                    ),

                    menuOptions(iconName: "user", title: "Edit Profile Setup"),
                    menuOptions(
                      iconName: "globe",
                      title: "Change Language",
                      onTap: () {
                        setState(() {
                          Get.to(() => ChangeLanguage());
                        });
                      },
                    ),
                    menuOptions(
                      iconName: "plan",
                      title: "Subscription Plan",
                      onTap: () {
                        setState(() {
                          Get.to(() => Subscription());
                        });
                      },
                    ),
                    menuOptions(
                      iconName: "bell",
                      title: "Receive Notification Via Email",
                      action: Switch(
                        value: recieveEmail,
                        padding: .all(0),
                        activeTrackColor: AppColors.blue,
                        inactiveTrackColor: AppColors.black.shade50,
                        onChanged: (val) {
                          setState(() {
                            recieveEmail = !recieveEmail;
                          });
                        },
                      ),
                      onTap: () {
                        setState(() {
                          recieveEmail = !recieveEmail;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: .all(12),
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
                  spacing: 8,
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "Support",
                      style: AppTexts.bodyLRegular.copyWith(
                        color: AppColors.black.shade300,
                      ),
                    ),

                    menuOptions(
                      iconName: "faq",
                      title: "Frequently Asked Questions",
                      onTap: () {
                        Get.to(() => Faq());
                      },
                    ),
                    menuOptions(
                      iconName: "support",
                      title: "Contact Support",
                      onTap: () {
                        Get.to(() => ContactSupport());
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: .all(12),
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
                  spacing: 8,
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "Legal",
                      style: AppTexts.bodyLRegular.copyWith(
                        color: AppColors.black.shade300,
                      ),
                    ),

                    menuOptions(
                      iconName: "logo",
                      title: "About GobalLang AI",
                      onTap: () {
                        Get.to(() => Info(title: "About Us"));
                      },
                    ),
                    menuOptions(
                      iconName: "privacy",
                      title: "Privacy Policy",
                      onTap: () {
                        Get.to(() => Info(title: "Privacy Policy"));
                      },
                    ),
                    menuOptions(
                      iconName: "terms",
                      title: "Terms & Services",
                      onTap: () {
                        Get.to(() => Info(title: "Terms & Services"));
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              CustomButton(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => OverlayConfirmation(
                      title: "Are you sure your want to",
                      highlight: "Delete your account??",
                      buttonTextLeft: "Confirm",
                      buttonCallBackLeft: () {
                        Get.back();
                      },
                      buttonTextRight: "Go Back",
                      buttonCallBackRight: () {
                        Get.back();
                      },
                    ),
                  );
                },
                text: "Delete Account",
                isSecondary: true,
              ),
              const SizedBox(height: 16),
              CustomButton(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => OverlayConfirmation(
                      title: "Are you sure your want to",
                      highlight: "Log Out??",
                      buttonTextLeft: "Confirm",
                      buttonCallBackLeft: () {
                        Get.offAll(() => Authentication());
                      },
                      buttonTextRight: "Go Back",
                      buttonCallBackRight: () {
                        Get.back();
                      },
                    ),
                  );
                },
                text: "Log Out",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget menuOptions({
    required String iconName,
    required String title,
    void Function()? onTap,
    Widget? action,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 32,
        child: Row(
          spacing: 12,
          children: [
            CustomSvg(asset: "assets/icons/$iconName.svg", size: 24),
            Expanded(
              child: Text(
                title,
                style: AppTexts.bodyLRegular.copyWith(
                  color: AppColors.black.shade300,
                ),
              ),
            ),
            if (action == null)
              CustomSvg(asset: "assets/icons/arrow_forward.svg", size: 24),
            ?action,
          ],
        ),
      ),
    );
  }
}

class EditableName extends StatefulWidget {
  const EditableName({super.key});

  @override
  State<EditableName> createState() => _EditableNameState();
}

class _EditableNameState extends State<EditableName> {
  final controller = TextEditingController(text: "Alex Johnson");
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    if (isEditing) {
      return Row(
        mainAxisSize: .min,
        spacing: 4,
        children: [
          // Spacer(),
          Expanded(child: TextField(
            controller: controller,
            selectAllOnFocus: true,
          )),
          CustomButton(
            onTap: () {
              setState(() {
                isEditing = false;
              });
            },
            text: "Save",
            height: 32,
            width: null,
            padding: 20,
          ),
        ],
      );
    }
    return Row(
      mainAxisSize: .min,
      spacing: 4,
      children: [
        Text("Alex Johnson", style: AppTexts.h4Semibold),
        GestureDetector(
          onTap: () {
            setState(() {
              isEditing = true;
            });
          },
          child: CustomSvg(asset: "assets/icons/edit.svg", size: 20),
        ),
      ],
    );
  }
}
