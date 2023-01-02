class UserModel{

  String? id;
  String? name;
  String? email;
  String? phone;
  String? orders_count;
  String? new_orders_count;
  String? avatar;

  UserModel({this.id,this.name,this.email,this.phone,this.orders_count,this.new_orders_count,this.avatar});

  factory UserModel.fromJson(Map<String,dynamic> json){
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      orders_count: json['orders_count'],
      new_orders_count: json['new_orders_count'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'id':id??"",
      'name':name,
      'email':email,
      'phone':phone,
      'orders_count':orders_count??"",
      'new_orders_count':new_orders_count??"",
      'avatar':avatar??"",
    };
  }

}