class ProductMainModel {
  int? productId;
  String? color;
  double? price;
  int? compareAtPrice;
  dynamic colorQty;
  String? image;
  String? color_code;
  String? color_image;
  int? availableColor;
  Product? product;
  String? set;

  ProductMainModel({
    this.productId,
    this.color,
    this.price,
    this.compareAtPrice,
    this.colorQty,
    this.image,
    this.color_code,
    this.color_image,
    this.availableColor,
    this.product,
    this.set,
  });

  factory ProductMainModel.fromJson(Map<String, dynamic> json) => ProductMainModel(
    productId: json["product_id"],
    color: json["color"],
    price: json["price"].toDouble(),
    compareAtPrice: json["compare_at_price"],
    colorQty: json["color_qty"],
    image: json["image"],
    color_code: json["color_code"],
    color_image: json["color_image"],
    availableColor: json["available_color"],
    product: Product.fromJson(json["product"]),
    set: json["set"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "color": color,
    "price": price,
    "compare_at_price": compareAtPrice,
    "color_qty": colorQty,
    "image": image,
    "color_code": color_code,
    "color_image": color_image,
    "available_color": availableColor,
    "product": product!.toJson(),
    "set": set,
  };
}


class Product {
  Product({
    this.id,
    this.name,
    this.articleNo,
    this.totalQuantity,
    this.image,
    this.color_code,
    this.color_image,
    this.price,
    this.compareAtPrice,
  });

  int? id;
  String? name;
  String? articleNo;
  dynamic? totalQuantity;
  String? image;
  String? color_code;
  String? color_image;
  double? price;
  int? compareAtPrice;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    articleNo: json["article_no"],
    totalQuantity: json["total_quantity"],
    image: json["image"],
    color_code: json["color_code"],
    color_image: json["color_image"],
    price: json["price"].toDouble(),
    compareAtPrice: json["compare_at_price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "article_no": articleNo,
    "total_quantity": totalQuantity,
    "image": image,
    "color_code": color_code,
    "color_image": color_image,
    "price": price,
    "compare_at_price": compareAtPrice,
  };
}
