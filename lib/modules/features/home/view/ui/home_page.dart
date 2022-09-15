// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:foodie/modules/features/home/controllers/product_controller.dart';
import 'package:foodie/modules/features/home/controllers/promo_controller.dart';
import 'package:foodie/modules/features/home/view/components/category_tile.dart';
import 'package:foodie/modules/features/home/view/components/discount_card.dart';
import 'package:foodie/modules/features/home/view/components/product_tile.dart';
import 'package:foodie/modules/features/home/view/components/search_box.dart';
import 'package:foodie/modules/features/home/view/components/voucher_card.dart';
import 'package:foodie/modules/features/home/view/ui/search_page.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../config/themes/theme.dart';
import '../../../main/controllers/main_controller.dart';
import '../../../sign-in/controllers/auth_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MainController cHome = Get.find<MainController>();

  final AuthController cAuth = Get.find<AuthController>();

  final PromoController cPromo = Get.find<PromoController>();

  final ProductController cProduct = Get.find();

  @override
  void initState() {
    handleGetPromo();
    super.initState();
  }

  handleGetPromo() async {
    var token = cAuth.readToken();
    await cPromo.getPromo(token);
  }

  @override
  Widget build(BuildContext context) {
    Widget body() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            SizedBox(
              height: 22,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/ic_promo.png',
                  width: 23,
                  height: 16,
                ),
                SizedBox(
                  width: 9,
                ),
                Text(
                  'Promo yang tersedia',
                  style: primaryTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: bold,
                  ),
                ),
                // ElevatedButton(onPressed: () => cPromo.isLoading.toggle(), child: Text('tes'))
              ],
            ),
            SizedBox(
              height: 21,
            ),
            Container(
              height: 150,
              child: ListView.builder(
                itemCount: cPromo.promo.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return ConditionalSwitch.single(
                    context: context,
                    valueBuilder: ((context) => cPromo.promo[index].type),
                    caseBuilders: {
                      'voucher': (context) =>
                          VoucherCard(promo: cPromo.promo[index]),
                      'diskon': (context) =>
                          DiscountCard(promo: cPromo.promo[index])
                    },
                    fallbackBuilder: (context) => SizedBox(),
                  );
                }),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 35,
              child: ListView.builder(
                itemCount: cProduct.categoryList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => CategoryTile(
                  name: cProduct.categoryList[index]['name'],
                  image: cProduct.categoryList[index]['image'],
                  index: index,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Image.asset(
                  cProduct.categoryImage.toString(),
                  color: primaryColor,
                  width: 24,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  cProduct.categoryName.toString(),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 300,
              child: ListView.builder(
                itemCount: cProduct.getProductByCategory.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => ProductTile(
                  product: cProduct.getProductByCategory[index],
                ),
              ),
            ),
            // cProduct.obx((state) => Container(
            //     height: 300,
            //     child: ListView.builder(
            //       itemCount: cProduct.getProductByCategory.length,
            //       scrollDirection: Axis.vertical,
            //       itemBuilder: (context, index) => ProductTile(
            //         product: cProduct.getProductByCategory[index],
            //       ),
            //     ),
            //   ),
            //   onEmpty: SizedBox(),
            //   onLoading: CircularProgressIndicator(),
            // )
          ],
        ),
      );
    }

    return Obx(
      () => ListView(
        children: [
          Material(
            elevation: 10,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
            child: SearchBox(),
          ),
          ProductController.to.isTyping.isTrue ? SearchPage() : body()
        ],
      ),
    );
  }
}
