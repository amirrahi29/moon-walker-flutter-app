class OrderModel {
  OrderModel({
    this.id,
    this.userId,
    this.orderNo,
    this.distributorSubtotal,
    this.retailerSubtotal,
    this.status,
    this.seen,
    this.user,
  });

  int? id;
  int? userId;
  String? orderNo;
  double? distributorSubtotal;
  double? retailerSubtotal;
  String? status;
  String? seen;
  User? user;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    id: json["id"],
    userId: json["user_id"],
    orderNo: json["order_no"],
    distributorSubtotal: json["distributor_subtotal"].toDouble(),
    retailerSubtotal: json["retailer_subtotal"].toDouble(),
    status: json["status"],
    seen: json["seen"],
    user: User.fromJson(json["user"],
    ));

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "order_no": orderNo,
    "distributor_subtotal": distributorSubtotal,
    "retailer_subtotal": retailerSubtotal,
    "status": status,
    "seen": seen,
    "user": user!.toJson(),
  };
}

class User {
  User({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.avatar,
  });

  int? id;
  String? name;
  String? phone;
  String? email;
  String? avatar;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "email": email,
    "avatar": avatar,
  };
}