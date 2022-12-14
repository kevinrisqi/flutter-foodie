// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodie/modules/features/home/controllers/product_controller.dart';
import 'package:foodie/modules/global_controllers/debouncer.dart';

import '../../../../../config/themes/theme.dart';
import 'package:get/get.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController cProduct = Get.find();
    Debouncer debouncer = Debouncer();

    return Container(
      width: double.infinity,
      height: 75,
      padding: EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      child: TextFormField(
        onChanged: (text) {
          debouncer.run(() {
            cProduct.searchProduct;
            cProduct.searchValue.value = text;
          });
        },
        controller: cProduct.searchController,
        decoration: InputDecoration(
          hintText: 'Pencarian',
          hintStyle: primaryTextStyle.copyWith(
            color: greyColor,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: primaryColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: primaryColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
