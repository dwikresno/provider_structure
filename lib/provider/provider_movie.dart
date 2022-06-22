import 'package:flutter/material.dart';
import 'package:provider_best_structure/API/api_movie.dart';
import 'package:provider_best_structure/models/DetailMovieModel.dart';
import 'package:provider_best_structure/models/NowPlayingModel.dart';
import 'package:provider_best_structure/models/PopularModel.dart';
import 'package:provider_best_structure/models/TopRatedModel.dart';
import 'package:provider_best_structure/models/UpcomingModel.dart';
import 'package:provider_best_structure/models/VideoMovieModel.dart';

class MovieProvider with ChangeNotifier {
  bool? isAllLoading = false;
  bool? isNowPlayingLoading = false;
  bool? isPopularLoading = false;
  bool? isTopRatedLoading = false;
  bool? isUpcomingLoading = false;
  bool? isDetailLoading = false;
  bool? isVideoLoading = false;
  //loading

  bool? isErrorNowPlaying = false;
  bool? isErrorPopular = false;
  bool? isErrorTopRated = false;
  bool? isErrorUpcoming = false;
  bool? isErrorDetail = false;
  bool? isErrorVideo = false;
  //error

  NowPlayingModel? _nowPlayingModel;
  PopularModel? _popularModel;
  TopRatedModel? _topRatedModel;
  UpcomingModel? _upcomingModel;
  DetailMovieModel? _detailMovieModel;
  VideoMovieModel? _videoMovieModel;
  //model

  NowPlayingModel get nowPlayingModel => _nowPlayingModel!;
  PopularModel get popularModel => _popularModel!;
  TopRatedModel get topRatedModel => _topRatedModel!;
  UpcomingModel get upcomingModel => _upcomingModel!;
  DetailMovieModel get detailMovieModel => _detailMovieModel!;
  VideoMovieModel get videoMovieModel => _videoMovieModel!;
  //get

  getNowPlayingModel({page = 1}) async {
    try {
      isNowPlayingLoading = true;
      _nowPlayingModel = await getNowPlayingAPI(page: page);
      isNowPlayingLoading = false;
      isErrorNowPlaying = false;
      notifyListeners();
    } catch (e) {
      print("error ${e.toString()}");
      isErrorNowPlaying = true;
      isNowPlayingLoading = false;
      notifyListeners();
    }
  }

  getPopularModel({page = 1}) async {
    try {
      isPopularLoading = true;
      _popularModel = await getPopularAPI(page: page);
      isPopularLoading = false;
      isErrorPopular = false;
      notifyListeners();
    } catch (e) {
      print("error ${e.toString()}");
      isErrorPopular = true;
      isPopularLoading = false;
      notifyListeners();
    }
  }

  getTopRatedModel({page = 1}) async {
    try {
      isTopRatedLoading = true;
      _topRatedModel = await getTopRatedAPI(page: page);
      isTopRatedLoading = false;
      isErrorTopRated = false;
      notifyListeners();
    } catch (e) {
      print("error ${e.toString()}");
      isErrorTopRated = true;
      isTopRatedLoading = false;
      notifyListeners();
    }
  }

  getUpcomingModel({page = 1}) async {
    try {
      isUpcomingLoading = true;
      _upcomingModel = await getUpcomingAPI(page: page);
      isUpcomingLoading = false;
      isErrorUpcoming = false;
      notifyListeners();
    } catch (e) {
      print("error ${e.toString()}");
      isErrorUpcoming = true;
      isUpcomingLoading = false;
      notifyListeners();
    }
  }

  getDetailMovie({@required id, page = 1}) async {
    try {
      isDetailLoading = true;
      _detailMovieModel = await getDetailMovieAPI(id: id, page: page);
      isDetailLoading = false;
      isErrorDetail = false;
      notifyListeners();
    } on Exception catch (e) {
      print("error detail ${e}");
      isErrorDetail = true;
      isDetailLoading = false;
      notifyListeners();
    }
  }

  getVideoMovie({@required id, page = 1}) async {
    try {
      isVideoLoading = true;
      _videoMovieModel = await getVideoMovieAPI(id: id, page: page);
      isVideoLoading = false;
      isErrorVideo = false;
      notifyListeners();
    } catch (e) {
      print("error video ${e.toString()}");
      isErrorVideo = true;
      isVideoLoading = false;
      notifyListeners();
    }
  }
}
