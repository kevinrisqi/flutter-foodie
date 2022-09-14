// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductRes _$ProductResFromJson(Map<String, dynamic> json) => ProductRes(
      statusCode: json['status_code'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductResToJson(ProductRes instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'data': instance.data,
    };
