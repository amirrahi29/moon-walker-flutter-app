class AuthenticationModel{

  String? request_with;
  String? phone;

  AuthenticationModel({this.request_with,this.phone});

  factory AuthenticationModel.fromJson(Map<String,dynamic> json){
    return AuthenticationModel(
      request_with: json['request_with'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'request_with':request_with,
      'phone':phone,
    };
  }

}


class AuthenticationModelOTP{

  String? request_with;
  String? phone;
  String? otp;

  AuthenticationModelOTP({this.request_with,this.phone,this.otp});

  factory AuthenticationModelOTP.fromJson(Map<String,dynamic> json){
    return AuthenticationModelOTP(
      request_with: json['request_with'],
      phone: json['phone'],
      otp: json['otp'],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'request_with':request_with,
      'phone':phone,
      'otp':otp,
    };
  }

}