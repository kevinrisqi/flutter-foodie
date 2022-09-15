// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodie/modules/features/home/controllers/product_controller.dart';
import 'package:foodie/modules/features/home/view/components/product_tile.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Container(
            width: double.infinity,
            height: 600,
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: ListView.builder(
              itemCount: ProductController.to.searchProduct.length,
              itemBuilder: (context, index) {
                return ProductTile(
                  product: ProductController.to.searchProduct[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
