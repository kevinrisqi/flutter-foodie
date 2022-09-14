import 'package:json_annotation/json_annotation.dart';

import 'data_product.dart';

part 'product_res.g.dart';

@JsonSerializable()
class ProductRes {
  @JsonKey(name: 'status_code')
  int? statusCode;
  List<DataProduct>? data;

  ProductRes({this.statusCode, this.data});

  factory ProductRes.fromJson(Map<String, dynamic> json) {
    return _$ProductResFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProductResToJson(this);
}
