import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
  fontFamily: GoogleFonts.lato(
    color: Colors.white,
  ).fontFamily,
  canvasColor: Colors.black,
  scaffoldBackgroundColor: Colors.black,
  pageTransitionsTheme: PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: Colors.white,
    secondary: Colors.white38,
    brightness: Brightness.light,
    // secondary: Colors,
  ),
  textTheme: TextTheme(
    headline1: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w900,
    ),
    headline2: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    subtitle1: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    subtitle2: TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w300,
    ),
    button: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w900,
    ),
  ),
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
  listTileTheme: ListTileThemeData(
    iconColor: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.light,
    elevation: 0,
    backgroundColor: Colors.transparent,
  ),
);

ThemeData lightTheme = ThemeData(
  fontFamily: GoogleFonts.lato(
    color: Colors.white,
  ).fontFamily,
  canvasColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  pageTransitionsTheme: PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: Colors.black,
    secondary: Colors.black45,
    brightness: Brightness.dark,
    // secondary: Colors,
  ),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    elevation: 0,
    backgroundColor: Colors.transparent,
  ),
  textTheme: TextTheme(
    headline1: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w900,
    ),
    headline2: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    subtitle1: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    subtitle2: TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.w300,
    ),
    button: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w900,
    ),
  ),
  iconTheme: IconThemeData(
    color: Colors.black,
  ),
  listTileTheme: ListTileThemeData(
    iconColor: Colors.black,
  ),
);
