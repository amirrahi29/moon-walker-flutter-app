class SizeModel{

  String? productId;
  String? size;
  String? status;
  dynamic? price;
  int? compare_at_price;
  String? total_quantity;
  String? image;

  SizeModel({this.size,this.status,this.price,this.compare_at_price,this.total_quantity,this.image,this.productId});

  factory SizeModel.fromJson(Map<String,dynamic> json){
    return SizeModel(
      size: json['size'],
      status: json['status'],
      price: json['price'],
      compare_at_price: json['compare_at_price'],
      total_quantity: json['total_quantity'],
      image: json['image'],
      productId: json['productId'],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'size':size,
      'status':status,
      'price':price,
      'compare_at_price':compare_at_price,
      'total_quantity':total_quantity,
      'image':image,
      'productId':productId,
    };
  }

  String toString(){
    return 'productId:$productId,size:$size';
  }

}