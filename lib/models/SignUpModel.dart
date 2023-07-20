class SignupModle {
  String? phone;
  String? email;
  String? password;
  String? name;
  SignupModle.fromJson (Map<String,dynamic> json){
   phone = json['phone'];
   email = json['email'];
   password = json['password'];
   name = json['name'];

  }
}