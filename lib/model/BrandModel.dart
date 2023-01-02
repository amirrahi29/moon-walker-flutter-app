import 'dart:convert';

class BrandModel {
  BrandModel({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
