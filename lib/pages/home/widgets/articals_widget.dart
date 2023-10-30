import 'package:flutter/material.dart';
import 'package:news_app_c9_mon_4pm/core/network_layer/api_manager.dart';
import 'package:news_app_c9_mon_4pm/models/articals_model.dart';

import '../../../models/source_model.dart';
import 'artical_item.dart';

class ArticalsWidget extends StatelessWidget {
  Source source;

  ArticalsWidget({
    super.key,
    required this.source,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ArticalsModel>(
      future: ApiManager.fetchArticals(source.id),
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

        List<Articles> articalsList = snapshot.data?.articles ?? [];
        return ListView.builder(
          padding: EdgeInsets.all(20),
          itemBuilder: (context, index) =>
              ArticalItem(articles: articalsList[index]),
          itemCount: articalsList.length,
        );
      },
    );
  }
}
