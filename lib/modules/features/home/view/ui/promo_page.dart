// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:foodie/config/themes/theme.dart';
import 'package:foodie/modules/features/home/controllers/promo_controller.dart';
import 'package:foodie/modules/features/home/models/promo_res/data_promo_model.dart';
import 'package:foodie/modules/features/home/view/components/discount_card.dart';
import 'package:foodie/modules/features/home/view/components/voucher_card.dart';
import 'package:foodie/modules/features/home/view/ui/home_page.dart';
import 'package:foodie/modules/features/main/controllers/main_controller.dart';
import 'package:foodie/modules/features/main/view/components/bottom_navbar.dart';
import 'package:foodie/modules/features/order/view/ui/order_page.dart';
import 'package:foodie/modules/features/profile/view/ui/profile_page.dart';
import 'package:foodie/modules/features/sign-in/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';

class PromoPage extends StatelessWidget {
  DataPromo? promo;
  PromoPage({this.promo, super.key});

  final MainController cMain = Get.find<MainController>();
  final AuthController controller = Get.find<AuthController>();

  Widget body() {
    switch (cMain.currentIndex.value) {
      case 0:
        return HomePage();
      case 1:
        return OrderPage();
      case 2:
        return ProfilePage();
      default:
        return HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: lightGreyColor,
      body: SafeArea(
        child: ListView(
          children: [
            Material(
              elevation: 10,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
              child: Container(
                height: 66,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                  color: backgroundColor,
                ),
                child: Stack(
                  // alignment: Alignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.chevron_left,
                      ),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/ic_promo.png',
                            width: 22,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Promo',
                            style: primaryTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.all(30),
                child: Conditional.single(
                  context: context,
                  conditionBuilder: (context) => promo!.type == 'voucher',
                  widgetBuilder: (context) => VoucherCard(
                    promo: promo!,
                    width: width,
                    height: 180,
                    margin: 0,
                  ),
                  fallbackBuilder: (context) => DiscountCard(
                    promo: promo!,
                    width: width,
                    height: 180,
                    margin: 0,
                  ),
                )),
            Container(
              width: double.infinity,
              height: 500,
              padding: EdgeInsets.only(
                top: 45,
                right: 22,
                left: 22,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                color: backgroundColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    promo!.type.toString().toUpperCase(),
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    promo!.nama.toString(),
                    style: primaryTextStyle.copyWith(
                      color: primaryColor,
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.list,
                        color: primaryColor,
                        size: 25,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Syarat Ketentuan',
                            style: primaryTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            constraints: BoxConstraints(maxWidth: 290),
                            child: Html(
                              data: promo!.syaratKetentuan.toString(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNarBar(),
    );
  }
}
