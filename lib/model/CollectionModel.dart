class CollectionModel{

  int? id;
  String? name;
  String? url;
  int? total_quantity;
  String? image;

  CollectionModel({this.id,this.name,this.url,this.total_quantity,this.image});

  factory CollectionModel.fromJson(Map<String,dynamic> json){
    return CollectionModel(
      id: json['id'],
      name: json['name'],
      url: json['url'],
      total_quantity: json['total_quantity'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'id':id??"",
      'name':name,
      'url':url,
      'total_quantity':total_quantity,
      'image':image,
    };
  }

}