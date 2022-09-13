import 'package:json_annotation/json_annotation.dart';

import 'data_promo_model.dart';

part 'promo_res.g.dart';

@JsonSerializable()
class PromoRes {
  @JsonKey(name: 'status_code')
  int? statusCode;
  List<DataPromo>? data;

  PromoRes({this.statusCode, this.data});

  factory PromoRes.fromJson(Map<String, dynamic> json) {
    return _$PromoResFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PromoResToJson(this);
}
