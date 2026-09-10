import 'dart:io';

import 'package:get/state_manager.dart';

class SupportController extends GetxController {
  Rxn<File> pickedImage = Rxn();
  RxBool isLoading = RxBool(false);
}
