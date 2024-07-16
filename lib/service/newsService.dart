import 'package:dio/dio.dart';
import 'package:news_app/model/news_model.dart';

class NewsService {
  final Dio dio = Dio();
  final String apiKey = "83dc786463654c43a5aaa3de5db3c2ad";
  final String baseUrl = "https://newsapi.org/v2/top-headlines";

  Future<List<NewsModel>> getNews() async {
    try {
      final response = await dio.get("$baseUrl?country=us&apiKey=$apiKey");
      if (response.statusCode == 200) {
        final List<dynamic> articles = response.data['articles'];
        List<NewsModel> newsList = articles.map((article) => NewsModel.fromJson(article)).toList();
        return newsList;
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      throw Exception('Failed to load news: $e');
    }
  }

  Future<List<NewsModel>> getCategoryNews(String category) async {
    try {
      final response = await dio.get("$baseUrl?country=us&category=$category&apiKey=$apiKey");
      if (response.statusCode == 200) {
        final List<dynamic> articles = response.data['articles'];
        List<NewsModel> newsList = articles.map((article) => NewsModel.fromJson(article)).toList();
        return newsList;
      } else {
        throw Exception('Failed to load news');
      }
    } catch (e) {
      throw Exception('Failed to load news: $e');
    }
  }
}
