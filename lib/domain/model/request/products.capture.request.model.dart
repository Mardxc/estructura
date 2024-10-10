// To parse this JSON data, do
//
//     final productsCaptureRequestModel = productsCaptureRequestModelFromJson(jsonString);

import 'dart:convert';

ProductsCaptureRequestModel productsCaptureRequestModelFromJson(String str) =>
    ProductsCaptureRequestModel.fromJson(json.decode(str));

String productsCaptureRequestModelToJson(ProductsCaptureRequestModel data) =>
    json.encode(data.toJson());

class ProductsCaptureRequestModel {
  String precioRegular;
  String precioOferta;
  bool otraPromocion;
  String tipoPromocion;
  String descripcionOferta;

  ProductsCaptureRequestModel({
    required this.precioRegular,
    required this.precioOferta,
    required this.otraPromocion,
    required this.tipoPromocion,
    required this.descripcionOferta,
  });

  factory ProductsCaptureRequestModel.fromJson(Map<String, dynamic> json) =>
      ProductsCaptureRequestModel(
        precioRegular: json['precio_regular'],
        precioOferta: json['precio_oferta'],
        otraPromocion: json['otra_promocion'],
        tipoPromocion: json['tipo_promocion'],
        descripcionOferta: json['descripcion_oferta'],
      );

  Map<String, dynamic> toJson() => {
        'precio_regular': precioRegular,
        'precio_oferta': precioOferta,
        'otra_promocion': otraPromocion,
        'tipo_promocion': tipoPromocion,
        'descripcion_oferta': descripcionOferta,
      };
}
