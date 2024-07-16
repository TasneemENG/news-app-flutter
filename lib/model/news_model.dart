class NewsModel {
  final String? title;
  final String? description;
  final String? image;

  NewsModel({required this.title, required this.description, required this.image});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'],
      description: json['description'],
      image: json['urlToImage'],
    );
  }

}
