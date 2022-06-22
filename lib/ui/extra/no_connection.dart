// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider_best_structure/utils/button.dart';
import 'package:provider_best_structure/utils/style.dart';

class NoConnectionPage extends StatefulWidget {
  final Function function;
  NoConnectionPage(this.function);

  @override
  State<NoConnectionPage> createState() => _NoConnectionPageState();
}

class _NoConnectionPageState extends State<NoConnectionPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "error",
              style: black14W900,
            ),
            refreshButton(
              function: widget.function,
            )
          ],
        ),
      ),
    );
  }
}
