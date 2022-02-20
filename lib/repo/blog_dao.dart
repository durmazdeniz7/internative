import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inter_native/core/token_helper.dart';
import 'package:inter_native/entities/blog.dart';
import 'package:inter_native/entities/blog_response.dart';


class BlogDao {
  List<Blog> parseResponseBlog(String body) {
    return BlogResponse.fromJson(jsonDecode(body)).blogs;
  }

  Future<List<Blog>> getBlog() async {
    var url = Uri.parse("http://test020.internative.net/Blog/GetBlogs");
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOiI2MjBmOGJhMWIwN2QxZTEzOWFmNWI0N2EiLCJuYmYiOjE2NDUxODU5NTMsImV4cCI6MTY0Nzc3Nzk1MywiaXNzIjoiaSIsImF1ZCI6ImEifQ._fPVNcm3RD1-fI3vy8HhPYhycYDvXPckG-rTm-_eo20";

    Map<String,dynamic> data={
      "CategoryId":null
    };
    var response = await http.post(url,body: jsonEncode(data), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      print(response.body);
      return parseResponseBlog(response.body);
    } else {
      print("Hata çıktı ${response.statusCode}");
      return <Blog>[];
    }
  }

  Future<void> getDATA() async {
    var url = Uri.parse("http://test020.internative.net/Blog/GetBlogs");
    String token =await TokenHelper.getToken();
    
        
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print('Token : ${token}');
    print(response.body);
  }
  Future<List<Blog>> getBlogWithCagetoyId(String categoryId) async {
    var url = Uri.parse("http://test020.internative.net/Blog/GetBlogs");
        String token =await TokenHelper.getToken();

   var data={
"CategoryId":categoryId
   };
   
    final response = await http.post(url,body: jsonEncode(data), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
  return parseResponseBlog(response.body);
  }
}
