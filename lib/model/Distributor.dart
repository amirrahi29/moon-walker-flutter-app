class Distributor {
  Distributor({
    this.id,
    this.name,
    this.avatar,
  });

  int? id;
  String? name;
  String? avatar;

  factory Distributor.fromJson(Map<String, dynamic> json) => Distributor(
    id: json["id"],
    name: json["name"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "avatar": avatar,
  };
}


class RetailerModel {
  RetailerModel({
    this.id,
    this.name,
    this.avatar,
  });

  int? id;
  String? name;
  String? avatar;

  factory RetailerModel.fromJson(Map<String, dynamic> json) => RetailerModel(
    id: json["id"],
    name: json["name"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "avatar": avatar,
  };
}

class DistributorModel {
  DistributorModel({
    this.id,
    this.name,
    this.retailer_id,
  });

  int? id;
  String? name;
  int? retailer_id;

  factory DistributorModel.fromJson(Map<String, dynamic> json) => DistributorModel(
    id: json["id"],
    name: json["name"],
    retailer_id: json["retailer_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "retailer_id": retailer_id,
  };
}