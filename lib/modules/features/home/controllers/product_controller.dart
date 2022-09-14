import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxString categoryName = 'Semua Menu'.obs;
  RxString categoryImage = 'assets/images/ic_all_food.png'.obs;
  RxInt index = 0.obs;
  TextEditingController noteController = TextEditingController();

  RxList categoryList = [
    {
      'image': 'assets/images/ic_all_food.png',
      'name': 'Semua Menu',
    },
    {
      'image': 'assets/images/ic_food.png',
      'name': 'Makanan',
    },
    {
      'image': 'assets/images/ic_drink.png',
      'name': 'Minuman',
    },
    {
      'image': 'assets/images/ic_food.png',
      'name': 'Snack',
    },
  ].obs;

  void changeCategory(String name, String image) {
    categoryName.value = name;
    categoryImage.value = image;
  }
}
