import 'dart:convert';

class SetModel {
  SetModel({
    this.size,
    this.quantity,
    this.price,
    this.compare_at_price,
    this.status
  });

  String? size;
  int? quantity;
  dynamic? price;
  int? compare_at_price;
  String? status;

  factory SetModel.fromJson(Map<String, dynamic> json) => SetModel(
    size: json["size"],
    quantity: json["quantity"],
    price: json["price"],
    compare_at_price: json["compare_at_price"],
    status: json["status"]
  );

  Map<String, dynamic> toJson() => {
    "size": size,
    "quantity": quantity,
    "price": price,
    "compare_at_price": compare_at_price,
    "status": status,
  };

  String toString(){
    return 'size:$size,quantity:$quantity,price:$price,compare_at_price:$compare_at_price,status:$status';
  }

}
