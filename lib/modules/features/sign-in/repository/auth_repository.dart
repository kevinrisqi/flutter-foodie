import 'dart:convert';
import 'package:foodie/modules/features/sign-in/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  String baseUrl = 'https://trainee.landa.id/javacode';

  Future<UserModel> login({String? email, String? password}) async {
    var url = '$baseUrl/auth/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = data['token'];
      return user;
    } else {
      throw Exception('Login Failed!');
    }
  }

  Future<UserModel> loginGoogle(
      {String? nama, String isGoogle = 'is_google', String? email}) async {
    var url = '$baseUrl/auth/login';
    var headers = {'Content-Type': 'application/json'};

    var body = jsonEncode({
      'is_google': isGoogle,
      'nama': nama,
      'email': nama,
    });

    print(body);

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = data['token'];
      return user;
    } else {
      throw Exception('Login Failed !');
    }
  }
}
