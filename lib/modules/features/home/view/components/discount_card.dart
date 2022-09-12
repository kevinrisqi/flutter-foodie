// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../../config/themes/theme.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 26,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/img_diskon1.png',
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
                RichText(
                  text: TextSpan(
                    style: primaryTextStyle.copyWith(
                      color: fullBlackColor,
                    ),
                    children: [
                      TextSpan(
                        text: 'Diskon',
                        style: primaryTextStyle.copyWith(
                          fontSize: 22,
                          fontWeight: extraBold,
                          color: backgroundColor,
                        ),
                      ),
                      TextSpan(
                        text: ' 10',
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
                    'Mengisi review yang ditentukan',
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
