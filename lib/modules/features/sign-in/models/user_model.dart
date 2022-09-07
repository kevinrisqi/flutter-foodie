// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

class UserModel {
  String? email;
  String? password;
  String? token;

  UserModel({
    this.email,
    this.password,
    this.token
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["email"],
        password: json["password"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "token": token,
      };
}
