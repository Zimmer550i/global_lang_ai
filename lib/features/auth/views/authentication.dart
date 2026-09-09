import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_lang_ai/core/utils/app_colors.dart';
import 'package:global_lang_ai/core/utils/app_texts.dart';
import 'package:global_lang_ai/core/utils/custom_svg.dart';
import 'package:global_lang_ai/core/widgets/custom_app_bar.dart';
import 'package:global_lang_ai/core/widgets/custom_button.dart';
import 'package:global_lang_ai/core/widgets/custom_loading.dart';
import 'package:global_lang_ai/core/widgets/custom_text_field.dart';
import 'package:global_lang_ai/features/auth/controllers/auth_controller.dart';
import 'package:global_lang_ai/features/auth/controllers/startup_controller.dart';
import 'package:global_lang_ai/features/auth/views/forgot_password.dart';
import 'package:global_lang_ai/features/auth/views/verification.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final controller = Get.find<AuthController>();
  bool isLogingIn = true;

  void onSubmit() async {
    // // Sample Implementation
    // final message = await isLogingIn ? controller.login() : controller.signup();

    // if (message == "success") {
    //   // Login here
    // } else {
    //   customSnackBar(message);
    // }

    if (isLogingIn) {
      Get.find<StartupController>().goToHome();
    } else {
      Get.to(() => Verification());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(hasLeading: false),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: .symmetric(horizontal: 20),
          child: Column(
            children: [
              header(),
              const SizedBox(height: 24),
              Container(
                padding: .all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: .circular(24),
                ),
                child: Column(
                  children: [
                    methodSwitch(),
                    const SizedBox(height: 24),
                    isLogingIn ? loginFields() : signupFields(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget loginFields() {
    return Column(
      spacing: 16,
      children: [
        CustomTextField(
          controller: controller.emailController,
          title: "Email Address",
          hintText: "name@company.com",
          leading: "assets/icons/email.svg",
        ),
        CustomTextField(
          controller: controller.passController,
          title: "Password",
          hintText: "••••••••",
          leading: "assets/icons/lock.svg",
          isPassword: true,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              Get.to(() => ForgotPassword());
            },
            child: Text(
              "Forgot password?",
              style: AppTexts.bodyLRegular.copyWith(color: AppColors.error),
            ),
          ),
        ),
        const SizedBox(),
        Obx(
          () => CustomButton(
            onTap: onSubmit,
            text: "Log In",
            isLoading: controller.isLoading.value,
          ),
        ),
        const SizedBox(),
        Row(
          spacing: 16,
          children: [
            Expanded(child: Divider()),
            Text(
              "OR CONTINUE WITH",
              style: AppTexts.bodyLRegular.copyWith(
                color: AppColors.black.shade300,
              ),
            ),
            Expanded(child: Divider()),
          ],
        ),
        Obx(
          () => Container(
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.black.shade50,
              borderRadius: .circular(24),
            ),
            child: controller.isSocialLoading.value
                ? CustomLoading()
                : Row(
                    spacing: 12,
                    mainAxisAlignment: .center,
                    children: [
                      CustomSvg(asset: "assets/icons/google.svg", size: 20),
                      Text("Google", style: AppTexts.bodyLRegular),
                    ],
                  ),
          ),
        ),
      ],
    );
  }

  Widget signupFields() {
    return Column(
      spacing: 16,
      children: [
        CustomTextField(
          controller: controller.nameController,
          title: "Full Name",
          hintText: "John Doe",
          leading: "assets/icons/user.svg",
        ),
        CustomTextField(
          controller: controller.emailController,
          title: "Email Address",
          hintText: "name@company.com",
          leading: "assets/icons/email.svg",
        ),
        CustomTextField(
          controller: controller.newPassController,
          title: "New Password",
          hintText: "••••••••",
          leading: "assets/icons/lock.svg",
          isPassword: true,
        ),
        CustomTextField(
          controller: controller.confirmPassController,
          title: "Confirm Password",
          hintText: "••••••••",
          leading: "assets/icons/lock.svg",
          isPassword: true,
        ),
        Row(
          crossAxisAlignment: .start,
          spacing: 8,
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: Obx(
                () => Checkbox(
                  value: controller.agreedTerms.value,
                  activeColor: AppColors.blue,
                  onChanged: (val) {
                    controller.agreedTerms.value =
                        !controller.agreedTerms.value;
                  },
                ),
              ),
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: "I agree to the ",
                  style: AppTexts.bodyLRegular,
                  children: [
                    TextSpan(
                      text: "Terms and Conditions",
                      style: AppTexts.bodyLRegular.copyWith(
                        color: AppColors.blue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Handle onTap here
                        },
                    ),
                    TextSpan(text: " and "),
                    TextSpan(
                      text: "Privacy Policy",
                      style: AppTexts.bodyLRegular.copyWith(
                        color: AppColors.blue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Handle onTap here
                        },
                    ),
                    TextSpan(text: "."),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(),
        Obx(
          () => CustomButton(
            onTap: onSubmit,
            text: "Sign Up",
            isLoading: controller.isLoading.value,
          ),
        ),
      ],
    );
  }

  Column header() {
    return Column(
      crossAxisAlignment: .start,
      children: [
        const SizedBox(height: 20),
        Center(
          child: Image.asset(
            "assets/images/${isLogingIn ? "signin" : "signup"}.png",
            height: 90,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          isLogingIn ? "Welcome Back" : "Create Account",
          style: AppTexts.h4Semibold,
        ),
        const SizedBox(height: 4),
        Text(
          isLogingIn
              ? "Enter your credentials to access your global workstation."
              : "Join the elite network of enterprise linguistic intelligence.",
          style: AppTexts.bodyLRegular.copyWith(
            color: AppColors.black.shade300,
          ),
        ),
      ],
    );
  }

  Widget methodSwitch() {
    final controller = Get.find<AuthController>();
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (controller.isLoading.value) {
              return;
            }
            setState(() {
              isLogingIn = true;
            });
          },
          child: Container(
            padding: .symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: isLogingIn
                      ? AppColors.yellow
                      : AppColors.black.shade100,
                ),
              ),
            ),
            child: Text(
              "Log In",
              style: AppTexts.h5Semibold.copyWith(
                color: isLogingIn ? AppColors.yellow : AppColors.black.shade400,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (controller.isLoading.value) {
              return;
            }
            setState(() {
              isLogingIn = false;
            });
          },
          child: Container(
            padding: .symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: !isLogingIn
                      ? AppColors.yellow
                      : AppColors.black.shade100,
                ),
              ),
            ),
            child: Text(
              "Sign Up",
              style: AppTexts.h5Semibold.copyWith(
                color: !isLogingIn
                    ? AppColors.yellow
                    : AppColors.black.shade400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
