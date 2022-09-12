// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../../config/themes/theme.dart';

class VoucherCard extends StatelessWidget {
  const VoucherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  'Voucher',
                  style: primaryTextStyle.copyWith(
                    fontSize: 22,
                    fontWeight: bold,
                    color: backgroundColor,
                  ),
                ),
                Text(
                  'Rp 200.000',
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
    );
  }
}
