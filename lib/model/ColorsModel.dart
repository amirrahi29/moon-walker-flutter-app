import 'dart:convert';

class ColorsModel {
  ColorsModel({
    this.productId,
    this.color,
    this.color_image,
    this.color_code,
    this.status,
    this.price,
    this.compare_at_price,
    this.total_quantity,
    this.image
  });

  String? productId;
  String? color;
  String? color_image;
  String? color_code;
  String? status;
  dynamic? price;
  int? compare_at_price;
  String? total_quantity;
  String? image;

  factory ColorsModel.fromJson(Map<String, dynamic> json) => ColorsModel(
    productId: json["productId"],
    color: json["color"],
    color_image: json["color_image"],
    color_code: json["color_code"],
    status: json["status"],
    price: json["price"],
    compare_at_price: json["compare_at_price"],
    total_quantity: json["total_quantity"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "color": color,
    "color_image": color_image,
    "color_code": color_code,
    "status": status,
    "price": price,
    "compare_at_price": compare_at_price,
    "total_quantity": total_quantity,
    "image": image
  };

  String toString(){
    return 'productId:$productId,color:$color,color_code:$color_code';
  }

}
