import 'package:flutter/material.dart';
import 'package:news_app_c9_mon_4pm/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel categoryModel;
  final int index;
  final Function onItemClick;

  const CategoryItem({
    super.key,
    required this.categoryModel,
    required this.index,
    required this.onItemClick,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () {

        onItemClick(categoryModel);
      },
      child: Container(
        decoration: BoxDecoration(
          color: categoryModel.categoryColor,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(25.0),
            topRight: const Radius.circular(25.0),
            bottomLeft: index % 2 == 0
                ? const Radius.circular(25.0)
                : const Radius.circular(0),
            bottomRight: index % 2 == 0
                ? const Radius.circular(0.0)
                : const Radius.circular(25.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(categoryModel.categoryImage),
            Text(
              categoryModel.categoryTitle,
              style: theme.textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
