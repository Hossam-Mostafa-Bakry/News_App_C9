import 'package:flutter/material.dart';

import '../../../models/source_model.dart';

class TabBarItem extends StatelessWidget {
  final Source source;
  bool selected;

  TabBarItem({
    super.key,
    required this.source,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      width: 120,
      height: 35,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: selected ? theme.primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(
          color: theme.primaryColor,
          width: 2,
        ),
      ),
      child: Text(
        source.name,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: selected ? Colors.white : theme.primaryColor,
        ),
      ),
    );
  }
}
