class SliderModel{

  int? id;
  String? name;
  String? mobile_image;

  SliderModel({this.id,this.name,this.mobile_image});

  factory SliderModel.fromJson(Map<String,dynamic> json){
    return SliderModel(
      id: json['id'],
      name: json['name'],
      mobile_image: json['mobile_image'],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'id':id??"",
      'name':name,
      'mobile_image':mobile_image,
    };
  }

}