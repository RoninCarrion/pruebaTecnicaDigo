import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbar {
  showSnackBar({required String title, required String message}) {
    Get.snackbar(title, message,
        duration: Duration(seconds: 2), backgroundColor: Colors.blue,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white);
  }
}
