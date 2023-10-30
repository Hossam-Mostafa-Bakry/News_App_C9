import 'package:flutter/material.dart';

class CategoryModel {
  final String categoryId;
  final String categoryTitle;
  final String categoryImage;
  final Color categoryColor;

  CategoryModel({
    required this.categoryId,
    required this.categoryTitle,
    required this.categoryImage,
    required this.categoryColor,
  });
}
