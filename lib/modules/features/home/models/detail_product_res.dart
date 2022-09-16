// To parse this JSON data, do
//
//     final detailMenuResponseModel = detailMenuResponseModelFromJson(jsonString);

import 'dart:convert';

DetailMenuResponseModel detailMenuResponseModelFromJson(String str) => DetailMenuResponseModel.fromJson(json.decode(str));

String detailMenuResponseModelToJson(DetailMenuResponseModel data) => json.encode(data.toJson());

class DetailMenuResponseModel {
    DetailMenuResponseModel({
        this.statusCode,
        this.data,
    });

    int? statusCode;
    Data? data;

    factory DetailMenuResponseModel.fromJson(Map<String, dynamic> json) => DetailMenuResponseModel(
        statusCode: json["status_code"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "data": data!.toJson(),
    };
}

class Data {
    Data({
        this.menu,
        this.topping,
        this.level,
    });

    Menu? menu;
    List<Level>? topping;
    List<Level>? level;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        menu: Menu.fromJson(json["menu"]),
        topping: List<Level>.from(json["topping"].map((x) => Level.fromJson(x))),
        level: List<Level>.from(json["level"].map((x) => Level.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "menu": menu!.toJson(),
        "topping": List<dynamic>.from(topping!.map((x) => x.toJson())),
        "level": List<dynamic>.from(level!.map((x) => x.toJson())),
    };
}

class Level {
    Level({
        this.idDetail,
        this.idMenu,
        this.keterangan,
        this.type,
        this.harga,
    });

    int? idDetail;
    int? idMenu;
    String? keterangan;
    String? type;
    int? harga;

    factory Level.fromJson(Map<String, dynamic> json) => Level(
        idDetail: json["id_detail"],
        idMenu: json["id_menu"],
        keterangan: json["keterangan"],
        type: json["type"],
        harga: json["harga"],
    );

    Map<String, dynamic> toJson() => {
        "id_detail": idDetail,
        "id_menu": idMenu,
        "keterangan": keterangan,
        "type": type,
        "harga": harga,
    };
}

class Menu {
    Menu({
        this.idMenu,
        this.nama,
        this.kategori,
        this.harga,
        this.deskripsi,
        this.foto,
        this.status,
    });

    int? idMenu;
    String? nama;
    String? kategori;
    int? harga;
    String? deskripsi;
    String? foto;
    int? status;

    factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        idMenu: json["id_menu"],
        nama: json["nama"],
        kategori: json["kategori"],
        harga: json["harga"],
        deskripsi: json["deskripsi"],
        foto: json["foto"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id_menu": idMenu,
        "nama": nama,
        "kategori": kategori,
        "harga": harga,
        "deskripsi": deskripsi,
        "foto": foto,
        "status": status,
    };
}
