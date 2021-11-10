import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateStatusController extends GetxController {
  late TextEditingController statusC;

  @override
  void onInit() {
    statusC = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    statusC.dispose();
    super.dispose();
  }
}
