import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/widget/CategoryCard.dart';

class CategoriesListView extends StatelessWidget {
  static const List<CategoryModel> categories = [
    CategoryModel(
      CategoryName: 'Business',
      image: 'newss/gg.jpeg',
    ),
    CategoryModel(
      CategoryName: 'Entertainment',
      image: 'newss/News Background Video.jpeg',
    ),
    CategoryModel(
      CategoryName: 'General',
      image: 'newss/Network and connection concept featuring network, networking, and connection.jpeg',
    ),
    CategoryModel(
      CategoryName: 'Health',
      image: 'newss/Free Vector _ Technology background with earth and circuit diagram.jpeg',
    ),
    CategoryModel(
      CategoryName: 'Science',
      image: 'newss/News (1).jpeg',
    ),
    CategoryModel(
      CategoryName: 'Sports',
      image: 'newss/Sport News templates.jpeg',
    ),
    CategoryModel(
      CategoryName: 'Technology',
      image: 'newss/Internet, AI, Artificial Intelligence.jpeg',
    ),
  ];

  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(category: categories[index]);
        },
      ),
    );
  }
}
