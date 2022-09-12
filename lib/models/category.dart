import 'dart:ui';

import 'package:flutter/foundation.dart';

class CategoryModel {
  String id;
  String title;
  String imageUrl;
  Color ColorCode;

  CategoryModel(this.id, this.title, this.imageUrl, this.ColorCode);

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel('Sports', 'Sports', 'assets/ball.png', Color(0xFFC91C22)),
      CategoryModel(
          'Politics', 'Politics', 'assets/Politics.png', Color(0xFF003E90)),
      CategoryModel('Health', 'Health', 'assets/health.png', Color(0xFFED1E79)),
      CategoryModel(
          'Business', 'Business', 'assets/bussines.png', Color(0xFFCF7E48)),
      CategoryModel('Environment', 'Environment', 'assets/environment.png',
          Color(0xFF4882CF)),
      CategoryModel(
          'Science', 'Science', 'assets/science.png', Color(0xFFF2D352)),
    ];
  }
}

