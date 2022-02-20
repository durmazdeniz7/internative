import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inter_native/core/token_helper.dart';
import 'package:inter_native/entities/category.dart';
import 'package:inter_native/entities/category_response.dart';


class CategoryDao {
  List<Category> parseResponseCategory(String body) {
    return CategoryResponse.fromJson(jsonDecode(body)).categories;
  }

  Future<List<Category>> getCategory() async {
    var url = Uri.parse("http://test020.internative.net/Blog/GetCategories");
    String token =TokenHelper.token!;
       
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print(response.body);
    return parseResponseCategory(response.body);
  }
}
