// ignore_for_file: use_key_in_widget_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:provider_best_structure/models/NowPlayingModel.dart';
import 'package:provider_best_structure/models/TopRatedModel.dart';
import 'package:provider_best_structure/models/UpcomingModel.dart';
import 'package:provider_best_structure/provider/provider_movie.dart';
import 'package:provider_best_structure/utils/style.dart';
import 'package:provider_best_structure/utils/url.dart';
import 'package:provider/provider.dart';

class MovieByTypePage extends StatefulWidget {
  final dataParam;
  MovieByTypePage({this.dataParam});

  @override
  State<MovieByTypePage> createState() => _MovieByTypePageState();
}

class _MovieByTypePageState extends State<MovieByTypePage> {
  NowPlayingModel? nowPlayingModel;
  TopRatedModel? topRatedModel;
  UpcomingModel? upcomingModel;
  MovieProvider? movieProviderCall;

  @override
  void initState() {
    movieProviderCall = Provider.of<MovieProvider>(context, listen: false);
    if (widget.dataParam['type'] == "now") {
      nowPlayingModel = movieProviderCall!.nowPlayingModel;
    } else if (widget.dataParam['type'] == "top") {
      topRatedModel = movieProviderCall!.topRatedModel;
    } else {
      upcomingModel = movieProviderCall!.upcomingModel;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(
      //   child: DrawerPage(),
      // ),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          widget.dataParam['type'] == "now"
              ? "Now Palying"
              : widget.dataParam['type'] == "top"
                  ? "Top Rated"
                  : "Upcoming",
          style: title24W900,
        ),
      ),
      body: GridView.builder(
        cacheExtent: 9999,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 5,
          childAspectRatio: 0.8,
        ),
        itemCount: widget.dataParam['type'] == "now"
            ? nowPlayingModel!.results!.length
            : widget.dataParam['type'] == "top"
                ? topRatedModel!.results!.length
                : upcomingModel!.results!.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width / 1.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: FadeInImage.assetNetwork(
                placeholder: "assets/gif/loading_image.gif",
                image: urlImage +
                    "${widget.dataParam['type'] == 'now' ? nowPlayingModel!.results![index].posterPath! : widget.dataParam['type'] == 'top' ? topRatedModel!.results![index].posterPath! : upcomingModel!.results![index].posterPath!}",
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
