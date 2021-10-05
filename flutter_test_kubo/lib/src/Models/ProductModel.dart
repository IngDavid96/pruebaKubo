// To parse this JSON data, do
//
//     final productsResponse = productsResponseFromJson(jsonString);

import 'dart:convert';

ProductsResponse productsResponseFromJson(String str) =>
    ProductsResponse.fromJson(json.decode(str));

String productsResponseToJson(ProductsResponse data) =>
    json.encode(data.toJson());

class ProductsResponse {
  ProductsResponse({
    this.code,
    this.data,
  });

  String code;
  List<Product> data;

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      ProductsResponse(
        code: json["code"],
        data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.categoria,
    this.cliente,
    this.colores,
    this.descripcion,
    this.disponible,
    this.estado,
    this.fechaCreacion,
    this.id,
    this.nombre,
    this.precio,
    this.tallas,
    this.video,
    this.descripcionPromo,
    this.idPromocion,
    this.valorPromo,
    this.idProductoPromo,
    this.fechaPromo,
    this.estadoPromo,
    this.likes,
    this.megusta,
    this.galeria,
    this.imagen,
  });

  String categoria;
  String cliente;
  String colores;
  String descripcion;
  String disponible;
  String estado;
  DateTime fechaCreacion;
  String id;
  String nombre;
  String precio;
  String tallas;
  DescripcionPromo video;
  DescripcionPromo descripcionPromo;
  String idPromocion;
  String valorPromo;
  String idProductoPromo;
  DateTime fechaPromo;
  String estadoPromo;
  String likes;
  String megusta;
  String galeria;
  String imagen;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        categoria: json["categoria"],
        cliente: json["cliente"],
        colores: json["colores"],
        descripcion: json["descripcion"],
        disponible: json["disponible"],
        estado: json["estado"],
        fechaCreacion: DateTime.parse(json["fecha_creacion"]),
        id: json["id"],
        nombre: json["nombre"],
        precio: json["precio"],
        tallas: json["tallas"],
        video: descripcionPromoValues.map[json["video"]],
        descripcionPromo: descripcionPromoValues.map[json["descripcion_promo"]],
        idPromocion: json["id_promocion"],
        valorPromo: json["valor_promo"],
        idProductoPromo: json["id_producto_promo"],
        fechaPromo: DateTime.parse(json["fecha_promo"]),
        estadoPromo: json["estado_promo"],
        likes: json["likes"],
        megusta: json["megusta"],
        galeria: json["galeria"],
        imagen: json["imagen"],
      );

  Map<String, dynamic> toJson() => {
        "categoria": categoria,
        "cliente": cliente,
        "colores": colores,
        "descripcion": descripcion,
        "disponible": disponible,
        "estado": estado,
        "fecha_creacion":
            "${fechaCreacion.year.toString().padLeft(4, '0')}-${fechaCreacion.month.toString().padLeft(2, '0')}-${fechaCreacion.day.toString().padLeft(2, '0')}",
        "id": id,
        "nombre": nombre,
        "precio": precio,
        "tallas": tallas,
        "video": descripcionPromoValues.reverse[video],
        "descripcion_promo": descripcionPromoValues.reverse[descripcionPromo],
        "id_promocion": idPromocion,
        "valor_promo": valorPromo,
        "id_producto_promo": idProductoPromo,
        "fecha_promo": fechaPromo.toIso8601String(),
        "estado_promo": estadoPromo,
        "likes": likes,
        "megusta": megusta,
        "galeria": galeria,
        "imagen": imagen,
      };
}

enum DescripcionPromo { EMPTY }

final descripcionPromoValues = EnumValues({"-": DescripcionPromo.EMPTY});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
