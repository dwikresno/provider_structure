import 'package:flutter/material.dart';
import 'package:provider_best_structure/models/NowPlayingModel.dart';
// import 'package:provider_best_structure/provider/provider_movie.dart';
import 'package:provider/provider.dart';
import 'package:provider_best_structure/provider/provider_movie.dart';
import 'package:provider_best_structure/route/route_name.dart';
import 'package:provider_best_structure/ui/extra/drawer.dart';
import 'package:provider_best_structure/ui/extra/no_connection.dart';
import 'package:provider_best_structure/utils/style.dart';
import 'package:provider_best_structure/utils/url.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MovieProvider? movieProviderCall;
  List<Results>? result;

  @override
  void initState() {
    movieProviderCall = Provider.of<MovieProvider>(context, listen: false);
    movieProviderCall!.getNowPlayingModel();
    movieProviderCall!.getPopularModel();
    movieProviderCall!.getTopRatedModel();
    movieProviderCall!.getUpcomingModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);
    return Scaffold(
      drawer: Drawer(
        child: DrawerPage(),
      ),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Movie App",
          style: title24W900,
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(
              right: 20,
            ),
            child: Icon(
              Icons.search,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              movieProvider.isErrorNowPlaying!
                  ? NoConnectionPage(movieProvider.getNowPlayingModel)
                  : movieProvider.isNowPlayingLoading!
                      ? Container(
                          height: 200,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : widgetNowPlaying(movieProvider),
              movieProvider.isErrorPopular!
                  ? NoConnectionPage(movieProvider.getPopularModel)
                  : movieProvider.isPopularLoading!
                      ? Container(
                          height: 200,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : widgetPopular(movieProvider),
              movieProvider.isErrorTopRated!
                  ? NoConnectionPage(movieProvider.getTopRatedModel)
                  : movieProvider.isTopRatedLoading!
                      ? Container(
                          height: 200,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : widgetTopRated(movieProvider),
              movieProvider.isErrorUpcoming!
                  ? NoConnectionPage(movieProvider.getUpcomingModel)
                  : movieProvider.isUpcomingLoading!
                      ? Container(
                          height: 200,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : widgetUpcoming(movieProvider),
              // widgetNowPlaying(MovieProvider)
            ],
          ),
        ),
      ),
    );
  }

  Widget widgetNowPlaying(MovieProvider movieProvider) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: movieProvider.nowPlayingModel.results!.length,
          options: CarouselOptions(
            height: 200,
            aspectRatio: 1,
            viewportFraction: 0.92,
            initialPage: movieProvider.nowPlayingModel.results!.length ~/ 2,
            enableInfiniteScroll: false,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: false,
            // onPageChanged: callbackFunction,
            scrollDirection: Axis.horizontal,
          ),
          itemBuilder: (BuildContext context, int index, int pageViewIndex) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  detailMovieRoute,
                  arguments: {
                    'id': movieProvider.nowPlayingModel.results![index].id,
                  },
                );
              },
              child: Stack(
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: urlImage +
                            movieProvider
                                .nowPlayingModel.results![index].backdropPath!,
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
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(16),
                            bottomLeft: Radius.circular(16),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              Colors.transparent,
                              Colors.black.withOpacity(0.5),
                              Colors.black,
                            ], // Gradient from https://learnui.design/tools/gradient-generator.html
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 10,
                        ),
                        child: Text(
                          movieProvider.nowPlayingModel.results![index].title!,
                          style: white20W900,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
        Visibility(
          visible: false,
          child: Container(
            margin: EdgeInsets.symmetric(
              vertical: 10,
            ),
            height: MediaQuery.of(context).size.height / 2.5,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10),
              cacheExtent: 9999,
              scrollDirection: Axis.horizontal,
              itemCount: movieProvider.nowPlayingModel.results!.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      detailMovieRoute,
                      arguments: {
                        'id': movieProvider.nowPlayingModel.results![index].id,
                      },
                    );
                  },
                  child: Container(
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
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: urlImage +
                            movieProvider
                                .nowPlayingModel.results![index].posterPath!,
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
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget widgetPopular(movieProvider) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Row(
            children: [
              Container(
                child: Text(
                  "Popular ",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Container(
                child: Text(
                  "Movie",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: 10,
          ),
          height: MediaQuery.of(context).size.height / 2.5,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10),
            cacheExtent: 9999,
            scrollDirection: Axis.horizontal,
            itemCount: movieProvider.popularModel.results.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    detailMovieRoute,
                    arguments: {
                      'id': movieProvider.popularModel.results![index].id,
                    },
                  );
                },
                child: Container(
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
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: urlImage +
                          movieProvider.popularModel.results[index].posterPath,
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
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget widgetTopRated(movieProvider) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Row(
            children: [
              Container(
                child: Text(
                  "Top ",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Container(
                child: Text(
                  "Rated",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: 10,
          ),
          height: MediaQuery.of(context).size.height / 2.5,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10),
            cacheExtent: 9999,
            scrollDirection: Axis.horizontal,
            itemCount: movieProvider.topRatedModel.results.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    detailMovieRoute,
                    arguments: {
                      'id': movieProvider.topRatedModel.results![index].id,
                    },
                  );
                },
                child: Container(
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
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: urlImage +
                          movieProvider.topRatedModel.results[index].posterPath,
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
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget widgetUpcoming(movieProvider) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Row(
            children: [
              Container(
                child: Text(
                  "Upcoming ",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Container(
                child: Text(
                  "Movie",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: 10,
          ),
          height: MediaQuery.of(context).size.height / 2.5,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10),
            cacheExtent: 9999,
            scrollDirection: Axis.horizontal,
            itemCount: movieProvider.upcomingModel.results.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    detailMovieRoute,
                    arguments: {
                      'id': movieProvider.upcomingModel.results![index].id,
                    },
                  );
                },
                child: Container(
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
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: urlImage +
                          movieProvider.upcomingModel.results[index].posterPath,
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
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
