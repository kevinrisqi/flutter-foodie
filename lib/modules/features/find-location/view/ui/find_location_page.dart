// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodie/config/themes/theme.dart';
import 'package:foodie/modules/features/home/view/ui/home_page.dart';

class FindLocationPage extends StatefulWidget {
  const FindLocationPage({super.key});

  @override
  State<FindLocationPage> createState() => _FindLocationPageState();
}

class _FindLocationPageState extends State<FindLocationPage> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  Future<Timer> startTimer() async {
    var duration = Duration(seconds: 2);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height - 100,
                margin: EdgeInsets.only(top: 50),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/bg_find_location.png',
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    'Mencari Lokasimu ...',
                    style: primaryTextStyle.copyWith(
                      fontSize: 22,
                      color: greyColor,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Image.asset(
                    'assets/images/ic_find_location.png',
                    width: 190,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 40 * 2,
                    child: Text(
                      'Perumahan Griyashanta Permata N-524, Mojolangu, Kec. Lowokwaru, Kota Malang',
                      style: primaryTextStyle.copyWith(
                          fontSize: 20, fontWeight: semiBold),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
