// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodie/modules/features/home/models/promo_res/data_promo_model.dart';
import 'package:foodie/modules/features/home/view/ui/promo_page.dart';
import 'package:foodie/modules/global_controllers/currency_format.dart';

import '../../../../../config/themes/theme.dart';
import 'package:get/get.dart';

class VoucherCard extends StatelessWidget {
  DataPromo? promo;
  double? width;
  double? height;
  double margin;
  VoucherCard(
      {this.width = 270,
      this.height = 150,
      this.margin = 26,
      this.promo,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(PromoPage(
        promo: promo,
      )),
      child: Container(
        margin: EdgeInsets.only(right: margin),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/img_voucher1.png',
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
                  Text(
                    promo!.type.toString(),
                    style: primaryTextStyle.copyWith(
                      fontSize: 22,
                      fontWeight: bold,
                      color: backgroundColor,
                    ),
                  ),
                  Stack(
                    children: [
                      Text(
                        CurrencyFormat.convertToIdr(promo!.nominal, 0),
                        style: primaryTextStyle.copyWith(
                            fontSize: 28,
                            fontWeight: superBold,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 0
                              ..color = backgroundColor),
                      ),
                      Text(
                        CurrencyFormat.convertToIdr(promo!.nominal, 0),
                        style: primaryTextStyle.copyWith(
                          fontSize: 28,
                          fontWeight: superBold,
                          color: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: 210,
                    child: Text(
                      promo!.nama.toString(),
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
