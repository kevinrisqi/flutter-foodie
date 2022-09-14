import 'package:foodie/modules/features/home/models/promo_res/data_promo_model.dart';
import 'package:foodie/modules/features/home/repository/promo_repository.dart';
import 'package:get/get.dart';

class PromoController extends GetxController {
  RxList<DataPromo> promo = <DataPromo>[].obs;
  RxBool isLoading = false.obs;

  Future<void> getPromo(String token) async {
    try {
      isLoading.value = true;
      await PromoRepository().fetchPromo(token).then((value) {
        promo.value = value.data!;
      });
      await Future.delayed(Duration(seconds: 1));
      isLoading.value = false;
      // print(await PromoRepository().fetchPromo(token));
    } catch (e) {
      print('Data kosong! $e');
    }
  }
}
