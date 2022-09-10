import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/themes/theme.dart';
import '../../../main/controllers/main_controller.dart';
import '../../../sign-in/controllers/auth_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final MainController cHome = Get.find<MainController>();
  final AuthController controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
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
        Container(
          margin: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${controller.nama}'),
              SizedBox(
                height: 12,
              ),
              Text('${controller.email}'),
              SizedBox(
                height: 10,
              ),
              Text(controller.readToken()),
            ],
          ),
        ),
      ],
    );
  }
}
