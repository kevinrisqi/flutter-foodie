// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promo_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PromoRes _$PromoResFromJson(Map<String, dynamic> json) => PromoRes(
      statusCode: json['status_code'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataPromo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PromoResToJson(PromoRes instance) => <String, dynamic>{
      'status_code': instance.statusCode,
      'data': instance.data,
    };
