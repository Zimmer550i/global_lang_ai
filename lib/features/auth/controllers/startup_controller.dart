import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_lang_ai/features/auth/views/language_selection.dart';

class StartupController extends GetxController {
  final Duration splashTimeDefault = Duration(seconds: 2);

  void verifyToken() async {
    final stopwatch = Stopwatch()..start();
    // Delayed actions
    await Future.delayed(Duration(seconds: 1));

    if (stopwatch.elapsed < splashTimeDefault) {
      await Future.delayed(splashTimeDefault - stopwatch.elapsed);
    }

    goToSelectLanguage();
  }

  void goToApp() {
    Get.off(() => FlutterLogo());
  }

  void goToAuthentication() {
    Get.off(() => FlutterLogo());
  }

  void goToSelectLanguage() {
    Get.off(() => LanguageSelection());
  }
}
