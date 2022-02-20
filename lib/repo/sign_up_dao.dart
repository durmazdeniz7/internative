import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inter_native/entities/sign_up.dart';
import 'package:inter_native/entities/sign_up_response.dart';

class SignUpDao {
  

  Future<SignUpResponse> signUp(
      String email, String password, String passwordRetry) async {
      var url = Uri.parse("http://test020.internative.net/Login/SignUp");
      var data = {
        "Email": email,
        "Password": password,
        "PasswordRetry": passwordRetry
      };

      var respoose = await http.post(url, body: jsonEncode(data), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Charset': 'utf-8'
      });
      return SignUpResponse.fromJson(jsonDecode(respoose.body));
    
  }
}
