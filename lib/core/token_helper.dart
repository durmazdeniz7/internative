import 'package:shared_preferences/shared_preferences.dart';

class TokenHelper {
  

 static Future<void> addToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await  sharedPreferences.setString("token", token);
  }
 static Future<String> getToken()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
String?    token=sharedPreferences.getString("token");
return token??"";




 }
}
