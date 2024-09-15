class SliderModel {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  SliderModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory SliderModel.fromJson(Map<String, dynamic> jsonData) {
    return SliderModel(
      author: jsonData['author'] ?? "",
      title: jsonData['title'] ?? "",
      description: jsonData['description'] ?? "",
      url: jsonData['url'] ?? "",
      urlToImage: jsonData['urlToImage'] ?? "",
      publishedAt: jsonData['publishedAt'] ?? "",
      content: jsonData['content'] ?? "",
    );
  }
}
