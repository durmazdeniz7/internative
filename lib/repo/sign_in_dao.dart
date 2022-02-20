import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inter_native/entities/sign_in_response.dart';


class SignInDao {
  

  Future<SignInResponse> signUp(
      String email, String password) async {
      var url = Uri.parse("http://test020.internative.net/Login/SignIn");
      var data = {
        "Email": email,
        "Password": password,
      };

      var respoose = await http.post(url, body: jsonEncode(data), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Charset': 'utf-8'
      });
      return SignInResponse.fromJson(jsonDecode(respoose.body));
    
  }
}
