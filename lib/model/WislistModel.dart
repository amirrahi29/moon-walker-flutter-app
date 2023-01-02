class WishlistProduct {
  WishlistProduct({
    this.cartId,
    this.id,
    this.name,
    this.price,
    this.compareAtPrice,
    this.totalQuantity,
    this.image,
  });

  int? cartId;
  int? id;
  String? name;
  double? price;
  int? compareAtPrice;
  String? totalQuantity;
  String? image;

  factory WishlistProduct.fromJson(Map<String, dynamic> json) => WishlistProduct(
    cartId: json["id"],
    id: json["id"],
    name: json["name"],
    price: json["price"].toDouble(),
    compareAtPrice: json["compare_at_price"],
    totalQuantity: json["total_quantity"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "cartId": cartId,
    "id": id,
    "name": name,
    "price": price,
    "compare_at_price": compareAtPrice,
    "total_quantity": totalQuantity,
    "image": image,
  };
}