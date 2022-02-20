class Category {
  String id;
  String title;
  String image;
  Category({
    required this.id,
    required this.title,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> map) =>
      Category(id: map["Id"], title: map["Title"], image: map["Image"]);
}
