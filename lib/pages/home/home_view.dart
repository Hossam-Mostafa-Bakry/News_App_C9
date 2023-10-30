import 'package:flutter/material.dart';
import 'package:news_app_c9_mon_4pm/pages/home/widgets/custom_drawer.dart';
import 'package:news_app_c9_mon_4pm/pages/home/widgets/news_details_view.dart';

import '../../models/category_model.dart';
import 'widgets/category_item.dart';

class HomeView extends StatefulWidget {
  static const String routeName = "home";

  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CategoryModel> categories = [
    CategoryModel(
      categoryId: "sports",
      categoryTitle: "Sports",
      categoryImage: "assets/images/sports_icon.png",
      categoryColor: const Color(0xFFC91C22),
    ),
    CategoryModel(
      categoryId: "general",
      categoryTitle: "Politics",
      categoryImage: "assets/images/politics_icon.png",
      categoryColor: const Color(0xFF003E90),
    ),
    CategoryModel(
      categoryId: "health",
      categoryTitle: "Health",
      categoryImage: "assets/images/health_icon.png",
      categoryColor: const Color(0xFFED1E79),
    ),
    CategoryModel(
      categoryId: "business",
      categoryTitle: "Business",
      categoryImage: "assets/images/bussines_icon.png",
      categoryColor: const Color(0xFFCF7E48),
    ),
    CategoryModel(
      categoryId: "environment",
      categoryTitle: "Enviroment",
      categoryImage: "assets/images/environment_icon.png",
      categoryColor: const Color(0xFF4882CF),
    ),
    CategoryModel(
      categoryId: "science",
      categoryTitle: "Science",
      categoryImage: "assets/images/science_icon.png",
      categoryColor: const Color(0xFFF2D352),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/pattern.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            selectedCategory == null
                ? "New App"
                : selectedCategory!.categoryTitle,
          ),
        ),
        drawer: CustomDrawer(
          onCategoryClicked: onDrawerCategoryClicked,
        ),
        body: selectedCategory == null
            ? Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Pick your category \n of interest",
                      textAlign: TextAlign.start,
                      style: theme.textTheme.titleLarge!.copyWith(
                        color: const Color(0xFF4F5A69),
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.all(20),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: 9 / 11,
                        ),
                        itemBuilder: (context, index) => CategoryItem(
                          categoryModel: categories[index],
                          index: index,
                          onItemClick: onCategoryItemClick,
                        ),
                        itemCount: categories.length,
                      ),
                    ),
                  ],
                ),
              )
            : NewsDetailsView(
                categoryModel: selectedCategory!,
              ),
      ),
    );
  }

  CategoryModel? selectedCategory;

  onCategoryItemClick(CategoryModel categoryModel) {
    print(categoryModel.categoryId);
    selectedCategory = categoryModel;
    setState(() {});
  }

  onDrawerCategoryClicked() {
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
