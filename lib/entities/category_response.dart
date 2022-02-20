
import 'package:inter_native/entities/category.dart';

class CategoryResponse {
  List<Category> categories;
  bool hasError;
  String message;
  List validationErrors;
  CategoryResponse({
    required this.categories,
    required this.hasError,
    required this.message,
    required this.validationErrors,
  });




  factory CategoryResponse.fromJson(Map<String, dynamic> map) {
    var list = map["Data"] as List;
    List<Category> categories = list.map((e) => Category.fromJson(e)).toList();
    return CategoryResponse(
        categories: categories,
        hasError: map["HasError"],
        message: map["Message"] ?? "",
        validationErrors: map["ValidationErrors"] ?? []);
  }
}
