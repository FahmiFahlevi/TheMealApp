import 'dart:async';

import 'package:themealdb_app/data/api.dart';
import 'package:themealdb_app/data/dio.dart';
import 'package:dio/dio.dart' as dio;

late API _api;
late Dio _dio;

class Repo {
  late _Data data;

  Repo() {
    _api = API();
    _dio = Dio();
    data = _Data();
  }
}

class _Data {
  Future<dio.Response> category() async {
    return await _dio.get(url: _api.data.category);
  }

  Future<dio.Response> filterCategory(String name) async {
    return await _dio.get(url: _api.data.filterCategory(name));
  }
}
