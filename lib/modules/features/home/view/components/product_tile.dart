// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:foodie/config/themes/theme.dart';
import 'package:foodie/modules/features/home/controllers/product_controller.dart';
import 'package:foodie/modules/features/home/models/product_res/data_product.dart';
import 'package:foodie/modules/global_controllers/currency_format.dart';
import 'package:get/get.dart';

class ProductTile extends StatelessWidget {
  DataProduct? product;

  ProductTile({this.product, super.key});

  @override
  Widget build(BuildContext context) {
    ProductController cProduct = Get.find();
    return Container(
      padding: EdgeInsets.all(7),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: lightWhiteColor,
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/img_food1.png',
            width: 75,
            height: 75,
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
                      width: 140,
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
          Obx(
            () => Row(
              children: [
                cProduct.qty.value == 0
                    ? SizedBox()
                    : GestureDetector(
                        onTap: () => cProduct.minQuantity(),
                        child: Image.asset(
                          'assets/images/ic_min.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                SizedBox(
                  width: 8,
                ),
                cProduct.qty.value == 0
                    ? SizedBox()
                    : Text(
                        cProduct.qty.toString(),
                        style: primaryTextStyle.copyWith(
                          fontWeight: bold,
                          fontSize: 18,
                        ),
                      ),
                SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () => cProduct.addQuantity(),
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
    );
  }
}
