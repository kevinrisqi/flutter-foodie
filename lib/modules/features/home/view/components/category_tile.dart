// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodie/modules/features/home/controllers/product_controller.dart';

import '../../../../../config/themes/theme.dart';
import 'package:get/get.dart';

class CategoryTile extends StatelessWidget {
  Color color;
  String? image;
  String? name;
  int? index;

  CategoryTile({
    this.color = Colors.black,
    this.image = 'assets/images/ic_all_food.png',
    this.name = 'name',
    this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ProductController cProduct = Get.find();
    return GestureDetector(
      onTap: () {
        cProduct.changeCategory(name!, image!);
      },
      child: Obx(
        () => Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 14),
          decoration: BoxDecoration(
            color:
                cProduct.index.value == index ? fullBlackColor : primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          margin: EdgeInsets.only(right: 12),
          child: Row(
            children: [
              Image.asset(image.toString()),
              SizedBox(
                width: 8,
              ),
              Text(
                name.toString(),
                style: primaryTextStyle.copyWith(
                  color: backgroundColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
