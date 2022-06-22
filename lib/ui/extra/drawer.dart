// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider_best_structure/provider/provider_theme.dart';
import 'package:provider_best_structure/route/route_name.dart';
import 'package:provider/provider.dart';

class DrawerPage extends StatefulWidget {
  final dataParm;
  DrawerPage({this.dataParm});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  late ThemeProvider themeProvider;

  @override
  void initState() {
    themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 180,
            color: Colors.blue,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, homeRoute);
            },
            child: Container(
              color: Colors.transparent,
              margin: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      right: 20,
                    ),
                    child: Icon(
                      Icons.home,
                    ),
                  ),
                  Container(
                    child: Text(
                      "Home",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                movieByTypeRoute,
                arguments: {
                  "type": "now",
                },
              );
            },
            child: Container(
              color: Colors.transparent,
              margin: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      right: 20,
                    ),
                    child: Icon(
                      Icons.play_circle_outline,
                    ),
                  ),
                  Container(
                    child: Text(
                      "Now Playing",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                movieByTypeRoute,
                arguments: {
                  "type": "top",
                },
              );
            },
            child: Container(
              color: Colors.transparent,
              margin: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      right: 20,
                    ),
                    child: Icon(
                      Icons.auto_graph_outlined,
                    ),
                  ),
                  Container(
                    child: Text(
                      "Top Rated",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                movieByTypeRoute,
                arguments: {
                  "type": "upcoming",
                },
              );
            },
            child: Container(
              color: Colors.transparent,
              margin: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      right: 20,
                    ),
                    child: Icon(
                      Icons.monitor,
                    ),
                  ),
                  Container(
                    child: Text(
                      "Upcoming",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          Container(
            color: Colors.transparent,
            margin: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    right: 20,
                  ),
                  child: Icon(
                    Icons.question_mark_outlined,
                  ),
                ),
                Container(
                  child: Text(
                    "About",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              themeProvider.changeTheme();
            },
            child: Container(
              color: Colors.transparent,
              margin: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      right: 20,
                    ),
                    child: Icon(
                      themeProvider.isDark()
                          ? Icons.light_mode
                          : Icons.dark_mode,
                    ),
                  ),
                  Container(
                    child: Text(
                      themeProvider.isDark() ? "Light Mode" : "Dark Mode",
                      style: Theme.of(context).textTheme.headline1,
                    ),
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
