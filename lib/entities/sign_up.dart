
class Signup {
 String? token;
 String get getToken=>token!;
  Signup({
    required this.token,
  });
 



 

  factory Signup.fromMap(Map<String, dynamic>? map) {
   return Signup(token:map?["Token"]??"");
  }


}
