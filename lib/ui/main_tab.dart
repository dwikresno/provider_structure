import 'package:flutter/material.dart';
import 'package:provider_best_structure/provider/provider_theme.dart';
import 'package:provider_best_structure/route/route_name.dart';
import 'package:provider_best_structure/utils/button.dart';
import 'package:provider/provider.dart';

class MainTabPage extends StatefulWidget {
  MainTabPage({Key? key}) : super(key: key);

  @override
  State<MainTabPage> createState() => _MainTabPageState();
}

class _MainTabPageState extends State<MainTabPage> {
  late ThemeProvider themeProvider;

  @override
  void initState() {
    themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customButton(
              text: "home",
              color: themeProvider.currentTheme.colorScheme.primary,
              function: () {
                Navigator.pushNamed(context, homeRoute);
              },
            ),
            customButton(
              text: "Detail Page",
              color: themeProvider.currentTheme.colorScheme.primary,
              function: () {
                Navigator.pushNamed(context, detailProductRoute);
              },
            ),
            customButton(
              text: "Unknown Page",
              color: themeProvider.currentTheme.colorScheme.primary,
              function: () {
                Navigator.pushNamed(context, search);
              },
            ),
            customButton(
              text: "Change Theme",
              color: themeProvider.currentTheme.colorScheme.primary,
              function: () {
                themeProvider.changeTheme();
              },
            ),
          ],
        ),
      ),
    );
  }
}
