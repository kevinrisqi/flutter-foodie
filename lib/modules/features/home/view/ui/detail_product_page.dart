// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodie/config/themes/theme.dart';
import 'package:foodie/modules/features/home/controllers/product_controller.dart';
import 'package:foodie/modules/features/home/view/components/detail_product_list.dart';
import 'package:foodie/modules/global_controllers/currency_format.dart';
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
              imageUrl: ProductController.to.detailProduct.value.menu!.foto
                  .toString(),
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
                        ProductController.to.detailProduct.value.menu!.nama
                            .toString(),
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
                              ProductController
                                          .to
                                          .productList[ProductController
                                              .to.indexProduct.value]
                                          .count ==
                                      0
                                  ? SizedBox()
                                  : GestureDetector(
                                      onTap: () => ProductController.to
                                          .minQuantity(ProductController
                                              .to.idMenu.value),
                                      child: Image.asset(
                                        'assets/images/ic_min.png',
                                        width: 20,
                                        height: 20,
                                      ),
                                    ),
                              SizedBox(
                                width: 8,
                              ),
                              ProductController
                                          .to
                                          .productList[ProductController
                                              .to.indexProduct.value]
                                          .count ==
                                      0
                                  ? SizedBox()
                                  : Text(
                                      ProductController
                                          .to
                                          .productList[ProductController
                                              .to.indexProduct
                                              .toInt()]
                                          .count
                                          .toString(),
                                      style: primaryTextStyle.copyWith(
                                        fontWeight: bold,
                                        fontSize: 18,
                                      ),
                                    ),
                              SizedBox(
                                width: 8,
                              ),
                              GestureDetector(
                                onTap: () => ProductController.to.addQuantity(
                                    ProductController.to.idMenu.value),
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
                    ProductController.to.detailProduct.value.menu!.deskripsi
                        .toString(),
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
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/ic_price.png',
                        width: 20,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Harga',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      Spacer(),
                      Text(
                        CurrencyFormat.convertToIdr(
                            ProductController
                                .to.detailProduct.value.menu!.harga,
                            0),
                        style: primaryTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: semiBold,
                          color: primaryColor,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () => Get.bottomSheet(
                      backgroundColor: Colors.white,
                      Column(
                        children: [
                          const SizedBox(height: 20),
                          const Center(
                            child: Text(
                              'Bottom Sheet',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/ic_level.png',
                          width: 20,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Level',
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Text(
                              '1',
                              style: primaryTextStyle.copyWith(
                                fontSize: 18,
                                fontWeight: regular,
                                color: fullBlackColor,
                              ),
                            ),
                            Icon(
                              Icons.chevron_right,
                              size: 30,
                              color: greyColor,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/ic_toping.png',
                        width: 20,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Toping',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Text(
                            'Mozarella',
                            style: primaryTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: regular,
                              color: fullBlackColor,
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            size: 30,
                            color: greyColor,
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/ic_note.png',
                        width: 20,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Catatan',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Text(
                            'Lorem Ipsum ...',
                            style: primaryTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: regular,
                              color: fullBlackColor,
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            size: 30,
                            color: greyColor,
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: primaryColor,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      child: Center(
                        child: Text(
                          'Tambahkan ke Pesanan',
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                  // Container(
                  //   height: 300,
                  //   child: ListView.builder(
                  //     itemBuilder: (context, index) {
                  //       return DetailProductList(
                  //         image: ProductController.to.detailMenuList[index]
                  //             ['image'],
                  //         name: ProductController.to.detailMenuList[index]
                  //             ['name'],
                  //         value: index == 0
                  //             ? ProductController
                  //                 .to.detailProduct.value.menu!.harga
                  //                 .toString()
                  //             : ProductController.to.detailMenuList[index]
                  //                 ['value'],
                  //         isVisible: ProductController.to.detailMenuList[index]
                  //             ['isVisible'],
                  //       );
                  //     },
                  //     itemCount: ProductController.to.detailMenuList.length,
                  //   ),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
