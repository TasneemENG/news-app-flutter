import 'package:flutter/material.dart';
import 'package:news_app/widget/CategoriesListView.dart';
import 'package:news_app/widget/NewsListView.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[200],
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'News',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'Cloud',
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 0),
              sliver: SliverToBoxAdapter(
                child: CategoriesListView(),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 5),
            ),
            NewsListViewScreen(),
          ],
        ),
      ),
    );
  }
}
