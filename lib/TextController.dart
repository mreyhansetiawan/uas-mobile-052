import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextController extends GetxController {
  TextEditingController kritikCtrl = TextEditingController();

  @override
  void onClose() {
    kritikCtrl.dispose();
    print("Text Controller sudah terhapus");
    super.onClose();
  }
}
