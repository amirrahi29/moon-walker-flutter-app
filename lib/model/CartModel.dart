import 'package:moon_walker/model/ColorsModel.dart';
import 'SizeModel.dart';

class CartProduct {
  CartProduct({
    this.id,
    this.articleNo,
    this.totalQuantity,
    this.image,
    this.price,
    this.compareAtPrice,
    this.retailer_subtotal,
    this.distributor_subtotal,
    this.colors,
    this.size,
  });

  int? id;
  String? articleNo;
  String? totalQuantity;
  String? image;
  dynamic? price;
  int? compareAtPrice;
  dynamic? retailer_subtotal;
  dynamic? distributor_subtotal = 0.0;
  List<ColorsModel>? colors;
  List<SizeModel>? size;

  factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
    id: json["id"],
    articleNo: json["article_no"],
    totalQuantity: json["total_quantity"],
    image: json["image"],
    price: json["price"],
    compareAtPrice: json["compare_at_price"],
    retailer_subtotal: json["retailer_subtotal"],
    distributor_subtotal: json["distributor_subtotal"],
    colors: List<ColorsModel>.from(json["colors"].map((x) => x)),
    size: List<SizeModel>.from(json["size"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "article_no": articleNo,
    "total_quantity": totalQuantity,
    "image": image,
    "price": price,
    "compare_at_price": compareAtPrice,
    "retailer_subtotal": retailer_subtotal,
    "distributor_subtotal": distributor_subtotal,
    "colors": List<dynamic>.from(colors!.map((x) => x)),
    "size": List<dynamic>.from(size!.map((x) => x)),
  };

  String toString(){
    return 'id:$id,colors:$colors,size:$size';
  }
}


