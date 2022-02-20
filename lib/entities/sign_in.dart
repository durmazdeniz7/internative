class SignIn {
 String? token;
 String get getToken=>token!;
  SignIn({
    required this.token,
  });
 



 

  factory SignIn.fromMap(Map<String, dynamic>? map) {
   return SignIn(token:map?["Token"]??"");
  }


}