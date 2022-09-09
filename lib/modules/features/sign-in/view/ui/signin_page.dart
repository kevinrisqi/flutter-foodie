// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:foodie/modules/features/sign-in/controllers/auth_controller.dart';
import 'package:foodie/modules/features/sign-in/view/components/header.dart';
import 'package:get/instance_manager.dart';

import '../components/content.dart';

class SignInPage extends StatefulWidget {
  SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.find<AuthController>();
    return Scaffold(
      body: controller.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : Container(
              margin: EdgeInsets.only(
                left: 46,
                right: 46,
              ),
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Header(),
                      Content(),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
