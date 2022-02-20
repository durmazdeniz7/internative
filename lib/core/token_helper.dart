import 'package:shared_preferences/shared_preferences.dart';

class TokenHelper {
  static String? token;
  

 static Future<void> addToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await  sharedPreferences.setString("token", token);
  }
 static Future<void> getToken()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token=sharedPreferences.getString("token");



 }
}
