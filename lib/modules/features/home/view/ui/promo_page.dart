// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodie/config/themes/theme.dart';
import 'package:foodie/modules/features/home/controllers/promo_controller.dart';
import 'package:foodie/modules/features/home/view/components/discount_card.dart';
import 'package:foodie/modules/features/home/view/ui/home_page.dart';
import 'package:get/get.dart';

class PromoPage extends StatelessWidget {
  const PromoPage({super.key});

  @override
  Widget build(BuildContext context) {
    PromoController cPromo = Get.find();
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.red,
      body: Material(
        elevation: 10,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.chevron_left,
                        size: 30,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: DiscountCard(
                  promo: cPromo.promo[1],
                  width: width,
                  height: 180,
                  margin: 0,
                ),
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [Text('data')],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
