// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:foodie/config/themes/theme.dart';
import 'package:foodie/modules/features/find-location/view/ui/find_location_page.dart';

class Content extends StatefulWidget {
  Content({super.key});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          obscureText: isVisible ? false : true,
          decoration: InputDecoration(
            hintText: 'Masukkan Password Anda',
            hintStyle: primaryTextStyle.copyWith(
              color: greyColor,
              fontWeight: light,
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Image.asset(
                  'assets/images/ic_visibility.png',
                  width: 2,
                  height: 2,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FindLocationPage()));
          },
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
                  RichText(
                    text: TextSpan(
                      style: primaryTextStyle.copyWith(
                        color: fullBlackColor,
                      ),
                      children: [
                        TextSpan(text: 'Masuk menggunakan'),
                        TextSpan(
                          text: ' Apple',
                          style: primaryTextStyle.copyWith(
                            fontWeight: bold,
                            color: fullBlackColor,
                          ),
                        ),
                      ],
                    ),
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
                  RichText(
                    text: TextSpan(
                      style: primaryTextStyle.copyWith(
                        color: backgroundColor,
                      ),
                      children: [
                        TextSpan(text: 'Masuk menggunakan'),
                        TextSpan(
                          text: ' Apple',
                          style: primaryTextStyle.copyWith(
                            fontWeight: bold,
                            color: backgroundColor,
                          ),
                        ),
                      ],
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
    );
  }
}
