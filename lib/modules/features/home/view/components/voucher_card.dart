// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foodie/modules/features/home/models/promo_res/data_promo_model.dart';
import 'package:foodie/modules/features/home/view/ui/promo_page.dart';

import '../../../../../config/themes/theme.dart';
import 'package:get/get.dart';

class VoucherCard extends StatelessWidget {
  late DataPromo promo;
  VoucherCard({required this.promo, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(PromoPage()),
      child: Container(
        margin: EdgeInsets.only(right: 26),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/img_voucher1.png',
                width: 270,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              width: 270,
              height: 150,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.85),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    promo.type.toString(),
                    style: primaryTextStyle.copyWith(
                      fontSize: 22,
                      fontWeight: bold,
                      color: backgroundColor,
                    ),
                  ),
                  Text(
                    'Rp ${promo.nominal}',
                    style: primaryTextStyle.copyWith(
                      fontSize: 28,
                      fontWeight: superBold,
                      color: backgroundColor,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: 210,
                    child: Text(
                      'Berhasil mereferensikan rekan/teman untuk menjadi karyawan',
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
