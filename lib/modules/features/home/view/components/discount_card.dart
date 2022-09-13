// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodie/modules/features/home/models/promo_res/data_promo_model.dart';
import 'package:foodie/modules/features/home/view/ui/promo_page.dart';

import '../../../../../config/themes/theme.dart';
import 'package:get/get.dart';

class DiscountCard extends StatelessWidget {
  late DataPromo promo;
  double? width;
  double? height;
  double margin;
  DiscountCard(
      {required this.promo, this.width = 270, this.height = 150, this.margin = 26, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(PromoPage()),
      child: Container(
        margin: EdgeInsets.only(
          right: margin,
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/img_diskon1.png',
                width: width,
                height: height,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.85),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      style: primaryTextStyle.copyWith(
                        color: fullBlackColor,
                      ),
                      children: [
                        TextSpan(
                          text: promo.type,
                          style: primaryTextStyle.copyWith(
                            fontSize: 22,
                            fontWeight: extraBold,
                            color: backgroundColor,
                          ),
                        ),
                        TextSpan(
                          text: ' ${promo.nominal}',
                          style: primaryTextStyle.copyWith(
                            fontWeight: superBold,
                            color: backgroundColor,
                            fontSize: 40,
                          ),
                        ),
                        TextSpan(
                          text: ' %',
                          style: primaryTextStyle.copyWith(
                            fontWeight: superBold,
                            color: backgroundColor,
                            fontSize: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: 210,
                    child: Text(
                      promo.nama.toString(),
                      textAlign: TextAlign.center,
                      style: primaryTextStyle.copyWith(
                        fontWeight: light,
                        fontSize: 12,
                        color: backgroundColor,
                      ),
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
