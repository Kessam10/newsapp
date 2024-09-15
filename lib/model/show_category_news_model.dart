class ShowCategoryNews {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  ShowCategoryNews({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory ShowCategoryNews.fromJson(Map<String, dynamic> jsonData) {
    return ShowCategoryNews(
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
