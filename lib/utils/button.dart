import 'package:flutter/material.dart';
import 'package:provider_best_structure/utils/style.dart';
import 'style.dart';

Widget customButton({
  verticalM = 20.0,
  horizontalM = 20.0,
  verticalP = 20.0,
  horizontalP = 20.0,
  color = Colors.black,
  text = "sample",
  style = natural14W500,
  @required function,
}) {
  return GestureDetector(
    onTap: function,
    child: Container(
      margin: EdgeInsets.symmetric(
        vertical: verticalM,
        horizontal: horizontalM,
      ),
      padding: EdgeInsets.symmetric(
        vertical: verticalP,
        horizontal: horizontalP,
      ),
      decoration: BoxDecoration(
        color: color,
      ),
      child: Center(
        child: Text(
          text,
          style: style,
        ),
      ),
    ),
  );
}

Widget refreshButton({
  @required function,
}) {
  return GestureDetector(
    onTap: function,
    child: Container(
      child: Icon(
        Icons.refresh,
        size: 30,
        color: Colors.black,
      ),
    ),
  );
}
