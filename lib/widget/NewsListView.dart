import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/service/newsService.dart';
import 'package:news_app/widget/NewsTile.dart';

class NewsListViewScreen extends StatefulWidget {
  const NewsListViewScreen({super.key});

  @override
  _NewsListViewScreenState createState() => _NewsListViewScreenState();
}

class _NewsListViewScreenState extends State<NewsListViewScreen> {
  List<NewsModel> newsList= [];

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    newsList = await NewsService().getNews();
      setState(() {

      });
    }

  @override
  Widget build(BuildContext context) {
    return SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              return NewsTile(news: newsList[index]);
            },
            childCount: newsList.length,
          ),
        );
  }
}
