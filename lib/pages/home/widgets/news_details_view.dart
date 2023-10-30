import 'package:flutter/material.dart';
import 'package:news_app_c9_mon_4pm/core/network_layer/api_manager.dart';
import 'package:news_app_c9_mon_4pm/models/category_model.dart';
import 'package:news_app_c9_mon_4pm/pages/home/widgets/news_view.dart';

import '../../../models/source_model.dart';


class NewsDetailsView extends StatelessWidget {
  final CategoryModel categoryModel;

  const NewsDetailsView({
    super.key,
    required this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceModel>(
      future: ApiManager.fetchSource(categoryModel.categoryId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        var sourceData = snapshot.data!;
        return NewsView(
          sourceModel: sourceData,
        );
      },
    );
  }
}
