import 'dart:convert';

import 'package:dio/dio.dart';

var dio = Dio();

Future<String> getHttp(type, paramUrl) async {
  try {
    Response resp =
        await dio.get('https://api.themoviedb.org/3/movie/$type?$paramUrl');
    print(jsonEncode(resp.data));
    return jsonEncode(resp.data);
  } on DioError catch (e) {
    print(e);
    if (e.response!.statusCode == 404) {
      print(e.response!.statusCode);
    } else {
      print(e.message);
    }
    return e.message;
  }
}
