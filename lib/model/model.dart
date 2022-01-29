class ModelNewsArticle {
  String title;
  String publishedAt;
  String description;
  String url;
  String urlToImage;

  ModelNewsArticle(
      {required this.title,
      required this.publishedAt,
      required this.description,
      required this.url,
      required this.urlToImage});

  factory ModelNewsArticle.fromJson(Map<String, dynamic> json) {
    return ModelNewsArticle(
        title: json['title'],
        description: json['description'],
        urlToImage: json['urlToImage'] ?? "",
        url: json['url'],
        publishedAt: json['publishedAt']);
  }
}
