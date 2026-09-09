import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final nameController = TextEditingController();
  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();
  final otpController = TextEditingController();

  RxBool isLoading = RxBool(false);
  RxBool isSocialLoading = RxBool(false);
  RxBool agreedTerms = RxBool(false);
}
