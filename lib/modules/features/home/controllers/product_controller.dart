import 'package:flutter/material.dart';
import 'package:foodie/modules/features/home/models/product_res/data_product.dart';
import 'package:foodie/modules/features/home/repository/product_repository.dart';
import 'package:foodie/modules/features/sign-in/controllers/auth_controller.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxString categoryName = 'Semua Menu'.obs;
  RxString categoryImage = 'assets/images/ic_all_food.png'.obs;
  RxInt index = 0.obs;
  RxInt qty = 0.obs;
  TextEditingController noteController = TextEditingController();
  RxList<DataProduct> productList = <DataProduct>[].obs;

  String token = AuthController().readToken();

  RxList categoryList = [
    {
      'image': 'assets/images/ic_all_food.png',
      'name': 'Semua Menu',
    },
    {
      'image': 'assets/images/ic_food.png',
      'name': 'Makanan',
    },
    {
      'image': 'assets/images/ic_drink.png',
      'name': 'Minuman',
    },
    {
      'image': 'assets/images/ic_food.png',
      'name': 'Snack',
    },
  ].obs;

  @override
  void onInit() {
    getProduct();
    super.onInit();
  }

  List<DataProduct> get getProductByCategory {
    if (categoryName.value.toLowerCase() == 'semua menu') {
      return productList;
    }
    List<DataProduct> result = productList
        .where((item) => item.kategori == categoryName.value.toLowerCase())
        .toList();
    // for (var item in result) {
    //   print('${item.nama} : type ${item.kategori}');
    // }
    return result;
  }

  Future<void> getProduct() async {
    try {
      await ProductRepository().fetchProduct(token).then((value) {
        productList.value = value.data!;
      });
      // print(productList);
    } catch (e) {
      print(e);
    }
  }

  void changeCategory(String name, String image) {
    categoryName.value = name;
    categoryImage.value = image;
  }

  void addQuantity() {
    qty++;
  }

  void minQuantity() {
    qty--;
  }
}
