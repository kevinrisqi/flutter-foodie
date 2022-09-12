import 'package:foodie/modules/features/home/models/promo_model.dart';
import 'package:foodie/modules/features/home/repository/promo_repository.dart';
import 'package:get/get.dart';

class PromoController extends GetxController {
  RxList<Promo> promo = <Promo>[].obs;

  Future<void> getPromo(String token) async {
    try {
      await PromoRepository().fetchPromo(token).then((value) {
        var statusCode = value.statusCode!;
        print(statusCode);
      });
      // print(await PromoRepository().fetchPromo(token));
    } catch (e) {
      print('Data kosong! $e');
    }
  }
}
