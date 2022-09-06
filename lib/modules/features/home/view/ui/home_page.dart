// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:foodie/config/themes/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: 70,
          padding: EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Pencarian',
              hintStyle: primaryTextStyle.copyWith(
                color: greyColor,
              ),
              prefixIcon: Icon(
                Icons.search,
                color: primaryColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: primaryColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: primaryColor,
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: blackColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: backgroundColor,
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.food_bank,
              color: greyColor,
            ),
            label: 'Pesanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: greyColor,
            ),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
