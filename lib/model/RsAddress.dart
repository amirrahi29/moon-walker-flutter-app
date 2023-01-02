class RsAddress {
  RsAddress({
    this.id,
    this.userId,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.locality,
    this.city,
    this.state,
    this.country,
    this.pincode,
  });

  int? id;
  int? userId;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? locality;
  String? city;
  String? state;
  String? country;
  String? pincode;

  factory RsAddress.fromJson(Map<String, dynamic> json) => RsAddress(
    id: json["id"],
    userId: json["user_id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    address: json["address"],
    locality: json["locality"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    pincode: json["pincode"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "name": name,
    "email": email,
    "phone": phone,
    "address": address,
    "locality": locality,
    "city": city,
    "state": state,
    "country": country,
    "pincode": pincode,
  };
}