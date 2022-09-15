import 'package:flutter/material.dart';
import 'package:foodie/modules/features/home/controllers/product_controller.dart';
import 'package:foodie/modules/features/home/view/components/product_tile.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    // return Obx(
    //   () => ListView.builder(
    //     itemCount: ProductController.to.searchProduct.length,
    //     itemBuilder: (context, index) {
    //       return ProductTile(
    //         product: ProductController.to.searchProduct[index],
    //       );
    //     },
    //   ),
    // );
    return Obx(() => Container(
      height: 100,
      width: double.infinity,color: Colors.red,
    
    ));
  }
}
