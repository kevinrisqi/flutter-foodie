import 'package:json_annotation/json_annotation.dart';

part 'data_product.g.dart';

@JsonSerializable()
class DataProduct {
  @JsonKey(name: 'id_menu')
  int? idMenu;
  String? nama;
  String? kategori;
  int? harga;
  String? deskripsi;
  String? foto;
  int? status;
  int? count;

  DataProduct({
    this.idMenu,
    this.nama,
    this.kategori,
    this.harga,
    this.deskripsi,
    this.foto,
    this.status,
    this.count = 0,
  });

  factory DataProduct.fromJson(Map<String, dynamic> json) =>
      _$DataProductFromJson(json);

  Map<String, dynamic> toJson() => _$DataProductToJson(this);
}
