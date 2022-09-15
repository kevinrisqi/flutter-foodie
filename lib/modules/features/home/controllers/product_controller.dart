import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foodie/modules/features/home/models/product_res/data_product.dart';
import 'package:foodie/modules/features/home/repository/product_repository.dart';
import 'package:foodie/modules/features/sign-in/controllers/auth_controller.dart';
import 'package:foodie/modules/global_controllers/debouncer.dart';
import 'package:get/get.dart';

class ProductController extends GetxController with StateMixin {
  RxString categoryName = 'Semua Menu'.obs;
  RxString categoryImage = 'assets/images/ic_all_food.png'.obs;
  RxInt index = 0.obs;
  RxInt qty = 0.obs;
  RxBool isLoading = false.obs;
  RxBool isTyping = false.obs;
  TextEditingController noteController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  RxList<DataProduct> productList = <DataProduct>[].obs;
  Debouncer debouncer = Debouncer();
  RxString searchValue = ''.obs;
  RxInt idMenu = 0.obs;
  RxInt indexProduct = 0.obs;

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

  static ProductController get to => Get.find();

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

  List<DataProduct> get searchProduct {
    if (searchController.text == '') {
      isTyping.value = false;
    } else {
      isTyping.value = true;
    }
    // print(isTyping.value);
    List<DataProduct> result = productList
        .where(
          (item) => item.nama!.toLowerCase().contains(
                searchValue.toLowerCase(),
              ),
        )
        .toList();
    // for (var item in result) {
    //   log('${item.nama} : type ${item.kategori}');
    // }
    // log(result.length.toString());
    return result;
  }

  Future<void> getProduct() async {
    change(RxStatus.loading());
    await ProductRepository().fetchProduct(token).then((value) {
      productList.value = value.data!;
      change(RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
    // print(productList);
  }

  void changeCategory(String name, String image) {
    categoryName.value = name;
    categoryImage.value = image;
  }

  void addQuantity(int id) {
    idMenu.value = id;
    getIndexProduct();
    productList[indexProduct.value].count =
        productList[indexProduct.value].count! + 1;
    print('ID Menu: $idMenu');
    print('Index Menu: $indexProduct');
    print('Nama: ${productList[indexProduct.value].nama}');
    print('Qty: ${productList[indexProduct.value].count}');
    update();
    // print(getIndexProduct());
    // qty++;
  }

  void minQuantity(int id) {
    idMenu.value = id;
    getIndexProduct();
    productList[indexProduct.value].count =
        productList[indexProduct.value].count! - 1;
    print('ID Menu: $idMenu');
    print('Index Menu: $indexProduct');
    print('Nama: ${productList[indexProduct.value].nama}');
    print('Qty: ${productList[indexProduct.value].count}');
    update();
  }

  void getIndexProduct() {
    indexProduct.value =
        productList.indexWhere((element) => element.idMenu == idMenu.value);
  }
}
