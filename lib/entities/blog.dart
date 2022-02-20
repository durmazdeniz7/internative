class Blog {
  String id;
  String categoryId;
  String image;
  String content;
  String title;
  Blog({
    required this.id,
    required this.categoryId,
    required this.image,
    required this.content,
    required this.title,
  });

  factory Blog.fromJson(Map<String, dynamic> map) => Blog(
      id: map["Id"],
      categoryId: map["CategoryId"],
      image: map["Image"],
      content: map["Content"],
      title: map["Title"]);
}
