import 'package:flutter/material.dart';
import 'package:news_app_c9_mon_4pm/models/source_model.dart';
import 'package:news_app_c9_mon_4pm/pages/home/widgets/tab_bar_item.dart';

import 'articals_widget.dart';

class NewsView extends StatefulWidget {
  final SourceModel sourceModel;

  NewsView({
    super.key,
    required this.sourceModel,
  });

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourceModel.sources.length,
      child: Column(
        children: [
          TabBar(
            labelPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide.none,
              ),
            ),
            isScrollable: true,
            onTap: (int index) {
              selectedIndex = index;
              setState(() {});
            },
            tabs: widget.sourceModel.sources
                .map(
                  (e) => TabBarItem(
                    source: e,
                    selected:
                        selectedIndex == widget.sourceModel.sources.indexOf(e),
                    // selectedIndex == widget.sourceModel.sources.indexOf(e),
                  ),
                )
                .toList(),
          ),
          Expanded(
            child: ArticalsWidget(
              source: widget.sourceModel.sources[selectedIndex],
            ),
          ),
        ],
      ),
    );
  }
}
