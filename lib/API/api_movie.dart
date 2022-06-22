import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider_best_structure/models/DetailMovieModel.dart';
import 'package:provider_best_structure/models/NowPlayingModel.dart';
import 'package:provider_best_structure/models/PopularModel.dart';
import 'package:provider_best_structure/models/TopRatedModel.dart';
import 'package:provider_best_structure/models/UpcomingModel.dart';
import 'package:provider_best_structure/models/VideoMovieModel.dart';
import 'package:provider_best_structure/service/api_service.dart';
import 'package:provider_best_structure/utils/url.dart';

Future<NowPlayingModel> getNowPlayingAPI({page = 1}) async {
  var paramUrl = [
    "page=$page",
    "api_key=$apikey",
    "language=en-US",
  ];
  String result = await getHttp(
    "now_playing",
    paramUrl.join("&"),
  );
  return NowPlayingModel.fromJson(jsonDecode(result));
}

Future<PopularModel> getPopularAPI({page = 1}) async {
  var paramUrl = [
    "page=$page",
    "api_key=$apikey",
    "language=en-US",
  ];
  String result = await getHttp(
    "popular",
    paramUrl.join("&"),
  );
  return PopularModel.fromJson(jsonDecode(result));
}

Future<TopRatedModel> getTopRatedAPI({page = 1}) async {
  var paramUrl = [
    "page=$page",
    "api_key=$apikey",
    "language=en-US",
  ];
  String result = await getHttp(
    "top_rated",
    paramUrl.join("&"),
  );
  return TopRatedModel.fromJson(jsonDecode(result));
}

Future<UpcomingModel> getUpcomingAPI({page = 1}) async {
  var paramUrl = [
    "page=$page",
    "api_key=$apikey",
    "language=en-US",
  ];
  String result = await getHttp(
    "upcoming",
    paramUrl.join("&"),
  );
  return UpcomingModel.fromJson(jsonDecode(result));
}

Future<DetailMovieModel> getDetailMovieAPI({@required id, page = 1}) async {
  var paramUrl = [
    "page=$page",
    "api_key=$apikey",
    "language=en-US",
  ];
  String result = await getHttp(
    "$id",
    paramUrl.join("&"),
  );
  return DetailMovieModel.fromJson(jsonDecode(result));
}

Future<VideoMovieModel> getVideoMovieAPI({@required id, page = 1}) async {
  var paramUrl = [
    "page=$page",
    "api_key=$apikey",
    "language=en-US",
  ];
  String result = await getHttp(
    "$id/videos",
    paramUrl.join("&"),
  );
  return VideoMovieModel.fromJson(jsonDecode(result));
}
