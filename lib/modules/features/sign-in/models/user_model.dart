import 'dart:convert';

class UserModel {
  String? nama;
  String? email;
  String? password;
  String? token;

  UserModel({this.nama, this.email, this.password, this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        nama: json["nama"],
        email: json["email"],
        password: json["password"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "email": email,
        "password": password,
        "token": token,
      };
}
