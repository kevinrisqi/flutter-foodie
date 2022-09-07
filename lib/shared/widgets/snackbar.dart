import 'package:foodie/config/themes/theme.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

SnackbarController snackbar(
  String title,
  String msg,
  Color textColor,
  SnackPosition position,
  Color bgColor,
) {
  return Get.snackbar(
    title,
    msg,
    colorText: textColor,
    snackPosition: position,
    backgroundColor: bgColor,
  );
}
