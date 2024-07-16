import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/service/newsService.dart';
import 'package:news_app/widget/NewsTile.dart';


class CategoryNewsScreen extends StatefulWidget {
  final String category;

  const CategoryNewsScreen({Key? key, required this.category}) : super(key: key);

  @override
  _CategoryNewsScreenState createState() => _CategoryNewsScreenState();
}

class _CategoryNewsScreenState extends State<CategoryNewsScreen> {
  List<NewsModel> _newsList = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchCategoryNews();
  }

  Future<void> _fetchCategoryNews() async {
    try {
      List<NewsModel> news = await NewsService().getCategoryNews(widget.category);
      setState(() {
        _newsList = news;
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching category news: $e');
      // Handle error here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[200],
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
        widget.category,
              style: const TextStyle(color: Colors.black),
            ),
            const Text(
              'News',
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _newsList.isEmpty
          ? const Center(child: Text('No news available'))
          : Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
                    itemCount: _newsList.length,
                    itemBuilder: (context, index) {
            return NewsTile(news: _newsList[index]);
                    },
                  ),
          ),
    );
  }
}
