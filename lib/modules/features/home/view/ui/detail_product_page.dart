// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodie/config/themes/theme.dart';
import 'package:foodie/modules/features/home/controllers/product_controller.dart';
import 'package:foodie/modules/features/home/view/components/detail_product_list.dart';
import 'package:get/get.dart';

class DetailProductPage extends StatelessWidget {
  const DetailProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    print('Passing ID Menu: ${ProductController.to.idMenu}');
    print('Instance Source ID: ${ProductController.to.getDetailProduct()}');
    return GetBuilder<ProductController>(
      builder: (controller) => Scaffold(
        backgroundColor: lightGreyColor,
        body: ListView(
          children: [
            Material(
              borderRadius: BorderRadius.circular(30),
              elevation: 5,
              child: Container(
                width: double.infinity,
                height: 66,
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.chevron_left,
                        size: 30,
                      ),
                    ),
                    Text(
                      'Detail Menu',
                      style: primaryTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: bold,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            CachedNetworkImage(
              imageUrl: ProductController.to.detailProduct.value.menu!.foto.toString(),
              width: 234,
              height: 181,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 45),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ProductController.to.detailProduct.value.menu!.nama.toString(),
                        style: primaryTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: bold,
                          color: primaryColor,
                        ),
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => ProductController.to.minQuantity(ProductController.to.idMenu.value),
                                child: Image.asset(
                                  'assets/images/ic_min.png',
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                ProductController.to.productList[ProductController.to.indexProduct.toInt()].count.toString(),
                                style: primaryTextStyle.copyWith(
                                  fontWeight: bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              GestureDetector(
                                onTap: () => ProductController.to.addQuantity(ProductController.to.idMenu.value),
                                child: Image.asset(
                                  'assets/images/ic_plus.png',
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    ProductController.to.detailProduct.value.menu!.deskripsi.toString(),
                    style: primaryTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 300,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return DetailProductList(
                          image: ProductController.to.detailMenuList[index]
                              ['image'],
                          name: ProductController.to.detailMenuList[index]
                              ['name'],
                          value: ProductController.to.detailMenuList[index]
                              ['value'],
                        );
                      },
                      itemCount: ProductController.to.detailMenuList.length,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
