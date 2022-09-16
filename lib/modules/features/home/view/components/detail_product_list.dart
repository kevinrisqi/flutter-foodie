// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:foodie/modules/features/home/controllers/product_controller.dart';

import '../../../../../config/themes/theme.dart';

class DetailProductList extends StatelessWidget {
  String? image;
  String? name;
  String? value;
  String? action;
  bool? isVisible;

  DetailProductList({
    Key? key,
    this.image,
    this.name,
    this.value,
    this.action,
    this.isVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('test visible: $isVisible');
    return !isVisible!
        ? SizedBox()
        : Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    image!,
                    width: 20,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    name!,
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  Spacer(),
                  name!.toLowerCase() == 'harga'
                      ? Text(
                          value!,
                          style: primaryTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                            color: primaryColor,
                          ),
                        )
                      : GestureDetector(
                          child: Row(
                            children: [
                              Text(
                                value!,
                                style: primaryTextStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: regular,
                                  color: fullBlackColor,
                                ),
                              ),
                              Icon(
                                Icons.chevron_right,
                                size: 25,
                                color: greyColor,
                              )
                            ],
                          ),
                        )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
              ),
            ],
          );
  }
}
