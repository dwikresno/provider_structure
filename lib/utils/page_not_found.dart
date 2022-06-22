import 'package:flutter/material.dart';
import 'package:provider_best_structure/utils/style.dart';

class PageNotFound extends StatefulWidget {
  PageNotFound({Key? key}) : super(key: key);

  @override
  State<PageNotFound> createState() => _PageNotFoundState();
}

class _PageNotFoundState extends State<PageNotFound> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "404",
              style: black20W900,
            ),
            Text(
              "Page Not Found",
              style: black14W500,
            ),
          ],
        ),
      ),
    );
  }
}
