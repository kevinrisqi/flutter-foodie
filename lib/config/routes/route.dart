// ignore_for_file: prefer_const_constructors

import 'package:foodie/modules/features/find-location/view/ui/find_location_page.dart';
import 'package:foodie/modules/features/main/view/ui/main_page.dart';
import 'package:foodie/modules/features/sign-in/view/ui/signin_page.dart';
import 'package:get/get.dart';

appRoutes() => [
  GetPage(name: '/sign-in', page: () => SignInPage()),
  GetPage(name: '/find-location', page: () => FindLocationPage()),
  GetPage(name: '/home', page: () => MainPage()),
];
