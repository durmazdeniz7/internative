

import 'package:inter_native/entities/blog.dart';

class BlogResponse {
  List<Blog> blogs;
  bool hasError;
  String message;
  List validationErrors;
  BlogResponse({
    required this.blogs,
    required this.hasError,
    required this.message,
    required this.validationErrors,
  });

  factory BlogResponse.fromJson(Map<String, dynamic> map) {
    var jsonList = map["Data"] as List;
    List<Blog> blogs = jsonList.map((e) => Blog.fromJson(e)).toList();
    return BlogResponse(
        blogs: blogs,
        hasError: map["HasError"],
        message: map["Message"] ?? "",
        validationErrors: map["ValidationErrors"] ?? []);
  }
}
