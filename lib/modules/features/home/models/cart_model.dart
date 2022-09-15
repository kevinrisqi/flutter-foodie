import 'package:foodie/modules/features/home/models/product_res/data_product.dart';

class CartModel {
  int? id;
  DataProduct? menu;
  int? quantity;
  String? catatan;

  CartModel({
    this.id,
    this.menu,
    this.quantity,
    this.catatan = '-',
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'] as int,
      menu: DataProduct.fromJson(json['menu']),
      quantity: json['quantity'] as int,
      catatan: json['catatan'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'menu': menu!.toJson(),
      'quantity': quantity,
      'catatan': catatan,
    };
  }

  int getTotalPrice() {
    return int.parse(menu!.harga.toString()) * quantity!;
  }
}