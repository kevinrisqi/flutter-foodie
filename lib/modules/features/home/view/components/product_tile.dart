// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodie/config/themes/theme.dart';
import 'package:foodie/modules/features/home/controllers/product_controller.dart';
import 'package:foodie/modules/features/home/models/product_res/data_product.dart';
import 'package:foodie/modules/features/home/view/ui/detail_product_page.dart';
import 'package:foodie/modules/global_controllers/currency_format.dart';
import 'package:get/get.dart';

class ProductTile extends StatelessWidget {
  DataProduct? product;

  ProductTile({this.product, super.key});

  @override
  Widget build(BuildContext context) {
    ProductController cProduct = Get.find();
    return GestureDetector(
      onTap: () => ProductController.to.toDetailProduct(product!.idMenu!),
      child: Container(
        padding: EdgeInsets.all(7),
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: lightWhiteColor,
        ),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: product!.foto.toString(),
              width: 75,
              height: 75,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product!.nama.toString(),
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    CurrencyFormat.convertToIdr(product!.harga, 0),
                    style: primaryTextStyle.copyWith(
                      color: primaryColor,
                      fontWeight: bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/images/ic_note.png',
                        width: 13,
                        height: 11,
                      ),
                      SizedBox(width: 4),
                      Container(
                        width: 120,
                        child: TextField(
                          style: primaryTextStyle.copyWith(
                            fontSize: 13,
                            fontWeight: light,
                          ),
                          controller: cProduct.noteController,
                          decoration: InputDecoration.collapsed(
                            hintText: 'Tambahkan Catatan',
                            hintStyle: primaryTextStyle.copyWith(
                              fontSize: 13,
                              fontWeight: light,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            GetBuilder<ProductController>(
              builder: (controller) => Row(
                children: [
                  product!.count == 0
                      ? SizedBox()
                      : GestureDetector(
                          onTap: () => cProduct.minQuantity(product!.idMenu!),
                          child: Image.asset(
                            'assets/images/ic_min.png',
                            width: 20,
                            height: 20,
                          ),
                        ),
                  SizedBox(
                    width: 8,
                  ),
                  product!.count == 0
                      ? SizedBox()
                      : Text(
                          product!.count.toString(),
                          style: primaryTextStyle.copyWith(
                            fontWeight: bold,
                            fontSize: 18,
                          ),
                        ),
                  SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: () => cProduct.addQuantity(product!.idMenu!),
                    child: Image.asset(
                      'assets/images/ic_plus.png',
                      width: 20,
                      height: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
