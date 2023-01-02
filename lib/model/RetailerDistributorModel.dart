import 'dart:convert';

class RetailerDistributorModel {
  RetailerDistributorModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.status,
    this.avatar
  });

  int? id;
  String? name;
  String? email;
  String? phone;
  String? status;
  String? avatar;

  factory RetailerDistributorModel.fromJson(Map<String, dynamic> json) => RetailerDistributorModel(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    status: json["status"],
    avatar: json["avatar"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "status": status,
    "avatar": avatar,
  };
}
