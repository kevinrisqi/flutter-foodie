// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:foodie/config/themes/theme.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          left: 46,
          right: 46,
        ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 79,
                    right: 79,
                    top: 80,
                    bottom: 121,
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/ic_logo.png',
                        width: 200,
                        height: 90,
                      ),
                    ],
                  ),
                ),
                Text(
                  'Masuk untuk melanjutkan!',
                  style: primaryTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Alamat Email',
                  style: primaryTextStyle.copyWith(
                    fontWeight: light,
                  ),
                ),
                TextFormField(
                  style: primaryTextStyle,
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Masukkan Email Anda',
                    hintStyle: primaryTextStyle.copyWith(
                      color: greyColor,
                      fontWeight: light,
                    ),
                  ),
                ),
                SizedBox(
                  height: 41,
                ),
                Text(
                  'Kata Sandi',
                  style: primaryTextStyle.copyWith(
                    fontWeight: light,
                  ),
                ),
                TextFormField(
                  style: primaryTextStyle,
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Masukkan Password Anda',
                    hintStyle: primaryTextStyle.copyWith(
                      color: greyColor,
                      fontWeight: light,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: Center(
                      child: Text(
                        'Masuk',
                        style: primaryTextStyle.copyWith(
                          color: backgroundColor,
                          fontWeight: bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Divider(
                          thickness: 1,
                          color: greyColor,
                        ),
                      ),
                    ),
                    Text(
                      'Atau',
                      style: primaryTextStyle.copyWith(
                        color: greyColor,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Divider(
                          thickness: 1,
                          color: greyColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: Center(
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/ic_google_logo.png',
                            width: 24,
                            height: 22,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Masuk menggunakan Google',
                            style: primaryTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: fullBlackColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: Center(
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/ic_apple_logo.png',
                            width: 24,
                            height: 22,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Masuk menggunakan Google',
                            style: primaryTextStyle.copyWith(
                              color: backgroundColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
