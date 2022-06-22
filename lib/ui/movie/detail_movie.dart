// ignore_for_file: use_key_in_widget_constructors, unused_field

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider_best_structure/provider/provider_movie.dart';
import 'package:provider_best_structure/ui/extra/no_connection.dart';
import 'package:provider_best_structure/utils/style.dart';
import 'package:provider_best_structure/utils/url.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailMoviePage extends StatefulWidget {
  final dataParam;
  DetailMoviePage({this.dataParam});

  @override
  State<DetailMoviePage> createState() => _DetailMoviePageState();
}

class _DetailMoviePageState extends State<DetailMoviePage> {
  MovieProvider? movieProviderCall;
  YoutubePlayerController? _controller;

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    movieProviderCall = Provider.of<MovieProvider>(context, listen: false);
    refreshData();
    super.initState();
  }

  refreshData() {
    movieProviderCall!.getDetailMovie(id: widget.dataParam['id']);
    movieProviderCall!.getVideoMovie(id: widget.dataParam['id']);
  }

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);
    if (!movieProvider.isVideoLoading! && !movieProvider.isErrorVideo!) {
      print(
          "cari ke ${movieProviderCall!.videoMovieModel.results!.where((element) => element.type == "Trailer").first.key!}");
      _controller = YoutubePlayerController(
        initialVideoId: movieProviderCall!.videoMovieModel.results!
            .where((element) => element.type == "Trailer")
            .first
            .key!,
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      );
    }
    return OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
      if (orientation == Orientation.landscape) {
        return WillPopScope(
          onWillPop: () async {
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.portraitUp,
              DeviceOrientation.portraitDown,
            ]);
            return false;
          },
          child: Scaffold(
            body: movieProvider.isErrorVideo!
                ? NoConnectionPage(refreshData)
                : movieProvider.isVideoLoading!
                    ? Container(
                        height: 200,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Align(
                        alignment: Alignment.center,
                        child: YoutubePlayer(
                          width: MediaQuery.of(context).size.width,
                          // aspectRatio: 1,
                          controller: _controller!,
                          showVideoProgressIndicator: true,
                          progressColors: ProgressBarColors(
                            playedColor: Colors.red,
                            handleColor: Colors.red,
                          ),
                          onReady: () {
                            // _controller.addListener(listener);
                          },
                        ),
                      ),
          ),
        );
      } else {
        return Scaffold(
          backgroundColor: Colors.black,
          body: movieProvider.isErrorDetail!
              ? NoConnectionPage(refreshData)
              : movieProvider.isDetailLoading!
                  ? Container(
                      height: 200,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : SingleChildScrollView(
                      child: Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 1.7,
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: urlImage +
                                  movieProvider.detailMovieModel.backdropPath!,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                      value: downloadProgress.progress,
                                    ),
                                  ),
                                );
                              },
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 3,
                            ),
                            child: ClipRRect(
                              // make sure we apply clip it properly
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                child: Container(
                                  height: MediaQuery.of(context).size.height,
                                  color: Colors.black.withOpacity(0.3),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height / 3.8,
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      child: Container(
                                        width: 130,
                                        height: 180,
                                        child: CachedNetworkImage(
                                          fit: BoxFit.fill,
                                          imageUrl: urlImage +
                                              movieProvider
                                                  .detailMovieModel.posterPath!,
                                          progressIndicatorBuilder:
                                              (context, url, downloadProgress) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator(
                                                  value:
                                                      downloadProgress.progress,
                                                ),
                                              ),
                                            );
                                          },
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text(
                                                movieProvider
                                                    .detailMovieModel.title!,
                                                style: white20W900,
                                              ),
                                            ),
                                            Wrap(
                                                children: movieProvider
                                                    .detailMovieModel.genres!
                                                    .map((item) {
                                              return Container(
                                                margin: EdgeInsets.only(
                                                  top: 2,
                                                  right: 2,
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                  vertical: 2,
                                                  horizontal: 5,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  color: Colors.black
                                                      .withOpacity(0.3),
                                                ),
                                                child: Text(
                                                  item.name!,
                                                  style: white14W500,
                                                ),
                                              );
                                            }).toList()),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 2),
                                              child: Text(
                                                DateTime.parse(movieProvider
                                                        .detailMovieModel
                                                        .releaseDate!)
                                                    .year
                                                    .toString(),
                                                style: white14W500,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 2),
                                              child: Text(
                                                (movieProvider.detailMovieModel
                                                                .runtime! ~/
                                                            60)
                                                        .toString() +
                                                    " Hours " +
                                                    (movieProvider
                                                                .detailMovieModel
                                                                .runtime! %
                                                            60)
                                                        .toString() +
                                                    " Minutes ",
                                                style: white14W500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Text(
                                  "TRAILER",
                                  style: white14W500,
                                ),
                              ),
                              movieProvider.isErrorVideo!
                                  ? NoConnectionPage(refreshData)
                                  : movieProvider.isVideoLoading!
                                      ? Container(
                                          height: 200,
                                          child: Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        )
                                      : Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                              vertical: 20,
                                              horizontal: 20,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              child: YoutubePlayer(
                                                controller: _controller!,
                                                showVideoProgressIndicator:
                                                    true,
                                                progressColors:
                                                    ProgressBarColors(
                                                  playedColor: Colors.red,
                                                  handleColor: Colors.red,
                                                ),
                                                onReady: () {
                                                  // _controller.addListener(listener);
                                                },
                                                thumbnail: CachedNetworkImage(
                                                  fit: BoxFit.cover,
                                                  imageUrl: urlImage +
                                                      movieProvider
                                                          .detailMovieModel
                                                          .backdropPath!,
                                                  progressIndicatorBuilder:
                                                      (context, url,
                                                          downloadProgress) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50,
                                                        height: 50,
                                                        child:
                                                            CircularProgressIndicator(
                                                          value:
                                                              downloadProgress
                                                                  .progress,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Icon(Icons.error),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 20,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                        vertical: 20,
                                      ),
                                      child: Text(
                                        "DESKRIPSI",
                                        style: white20W900,
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        movieProvider
                                            .detailMovieModel.overview!,
                                        style: white14W500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
        );
      }
    });
  }
}
