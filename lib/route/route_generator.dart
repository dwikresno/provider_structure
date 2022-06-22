// ignore_for_file: unnecessary_brace_in_string_interps, avoid_print

import 'package:flutter/material.dart';
import 'package:provider_best_structure/route/route_name.dart';
import 'package:provider_best_structure/ui/home/home.dart';
import 'package:provider_best_structure/ui/main_tab.dart';
import 'package:provider_best_structure/ui/movie/detail_movie.dart';
import 'package:provider_best_structure/ui/movie/movie_by_type.dart';
import 'package:provider_best_structure/ui/product/detail_product_page.dart';
import 'package:provider_best_structure/utils/page_not_found.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    //this variable for send argument to direct class
    var routes = <String, WidgetBuilder>{
      homeRoute: (_) => HomePage(),
      mainTabRoute: (_) => MainTabPage(),
      detailProductRoute: (_) => DetailProducPage(),
      movieByTypeRoute: (_) => MovieByTypePage(
            dataParam: args,
          ),
      detailMovieRoute: (_) => DetailMoviePage(
            dataParam: args,
          ),
    };
    WidgetBuilder? builder = routes[settings.name];
    return MaterialPageRoute(
        settings: RouteSettings(
          name: settings.name,
        ),
        builder: (ctx) => builder == null ? PageNotFound() : builder(ctx));
  }

  static Route<dynamic>? errorRoute(RouteSettings settings) {
    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) {
        return PageNotFound();
      },
    );
  }
}
