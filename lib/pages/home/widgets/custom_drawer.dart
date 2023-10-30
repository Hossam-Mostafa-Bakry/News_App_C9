import 'package:flutter/material.dart';
import 'package:news_app_c9_mon_4pm/pages/settings/settings_view.dart';

class CustomDrawer extends StatelessWidget {
  final Function onCategoryClicked;

  const CustomDrawer({
    super.key,
    required this.onCategoryClicked,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    return Container(
      width: mediaQuery.width * 0.75,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: mediaQuery.height * 0.15,
            color: theme.primaryColor,
            child: const Text(
              "News App!",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          GestureDetector(
            onTap: () {
              onCategoryClicked();
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.menu,
                    size: 34,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Categories",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, SettingsView.routreName);
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    size: 34,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Settings",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
