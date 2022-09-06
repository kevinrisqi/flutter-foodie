import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 79,
        right: 79,
        top: 40,
        bottom: 40,
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
    );
  }
}
