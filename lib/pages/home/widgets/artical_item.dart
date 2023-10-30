import 'package:flutter/material.dart';
import 'package:news_app_c9_mon_4pm/models/articals_model.dart';

class ArticalItem extends StatelessWidget {
  Articles articles;

  ArticalItem({
    super.key,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Image.network(
            articles.urlToImage ?? "",
          ),
        ),
        const SizedBox(height: 10),
        Text(
          articles.source?.name ?? "",
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
            color: Color(0xFF79828B),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          articles.title ?? "",
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: Color(0xFF42505C),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          articles.publishedAt ?? "",
          textAlign: TextAlign.end,
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: Color(0xFFA3A3A3),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
