import 'dart:convert';
import 'package:foodie/modules/features/home/models/promo_res/promo_res.dart';
import 'package:http/http.dart' as http;

class PromoRepository {
  String baseUrl = 'https://trainee.landa.id/javacode';

  Future<PromoRes> fetchPromo(String token) async {
    var url = '$baseUrl/promo/all';
    var headers = {'token': token};
    var response = await http.get(Uri.parse(url), headers: headers);
    // print(response.body);

    // Promo promo = Promo(idPromo: 100, diskon: 10000, createdAt: 2020-02-20, createdBy: 2020-03-03, foto: 'image.png',isDeleted: 2020-04-04,kadaluarsa: 2022-03-03, nama: 'Makin hemat', nominal: 200000, syaratKetentuan: 'Masuk kerja tanpa terlambat', type: 'Diskon',);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      // PromoResponseModel result = PromoResponseModePl.fromJson(json);
      return PromoRes.fromJson(json);
    } else {
      throw Exception('Data gagal dimuat');
    }
  }
}
