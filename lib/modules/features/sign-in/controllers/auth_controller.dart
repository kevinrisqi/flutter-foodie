import 'package:flutter/material.dart';
import 'package:foodie/config/themes/theme.dart';
import 'package:foodie/modules/features/sign-in/models/user_model.dart';
import 'package:foodie/modules/features/sign-in/repository/auth_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final isAuth = false.obs;
  final isVisible = false.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late UserModel _user;

  Future<bool> login({String? email, String? password}) async {
    try {
      if (email != '' || password != '') {
        if (GetUtils.isEmail(email!)) {
          UserModel user = await AuthRepository().login(
            email: email,
            password: password,
          );
          _user = user;
          writeToken();
          print(_user.token);
          return true;
        } else {
          Get.snackbar(
            "Login Failed",
            "Email tidak valid !",
            colorText: backgroundColor,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: alertColor,
          );
          // return false;
        }
      } else {
        Get.snackbar(
          "Form Kosong",
          "Email atau password tidak boleh kosong !",
          colorText: backgroundColor,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: alertColor,
        );
        // return false;
      }
    } catch (e) {
      return false;
    }
  }

  void writeToken() {
    final box = GetStorage();
    box.write('token', _user.token);
  }
}
