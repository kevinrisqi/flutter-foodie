import 'package:foodie/modules/features/order/view/ui/order_page.dart';
import 'package:foodie/modules/features/profile/view/ui/profile_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../home/view/ui/home_page.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  Widget changePage() {
    switch (currentIndex.value) {
      case 0:
        return HomePage();
      case 1:
        return OrderPage();
      case 2:
        return ProfilePage();
      default:
        return HomePage();
    }
  }
}
