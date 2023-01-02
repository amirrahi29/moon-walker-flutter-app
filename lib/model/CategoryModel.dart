class CategoryModel{

  int? id;
  String? name;
  String? image;

  CategoryModel({this.id,this.name,this.image});

  factory CategoryModel.fromJson(Map<String,dynamic> json){
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'id':id??"",
      'name':name,
      'image':image,
    };
  }

}