import 'dart:convert';

import 'package:foodie/modules/features/home/models/product_res/product_res.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  String baseUrl = 'https://trainee.landa.id/javacode';

  Future<ProductRes> fetchProduct(String token) async {
    var url = '$baseUrl/menu/all';
    var headers = {'token': token};
    var response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      var json = jsonDecode(url);
      return ProductRes.fromJson(json);
    } else {
      throw Exception('Data gagal dimuat');
    }
  }
}
