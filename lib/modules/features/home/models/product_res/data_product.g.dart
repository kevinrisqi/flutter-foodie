// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataProduct _$DataProductFromJson(Map<String, dynamic> json) => DataProduct(
      idMenu: json['id_menu'] as int?,
      nama: json['nama'] as String?,
      kategori: json['kategori'] as String?,
      harga: json['harga'] as int?,
      deskripsi: json['deskripsi'] as String?,
      foto: json['foto'] as String?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$DataProductToJson(DataProduct instance) =>
    <String, dynamic>{
      'id_menu': instance.idMenu,
      'nama': instance.nama,
      'kategori': instance.kategori,
      'harga': instance.harga,
      'deskripsi': instance.deskripsi,
      'foto': instance.foto,
      'status': instance.status,
    };
