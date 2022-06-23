import 'dart:async';
import 'package:dio/dio.dart' as dio;
import 'package:themealdb_app/data/repo.dart';

late Repo _repo;

class Request {
  late _Data data;

  Request() {
    data = _Data();
    _repo = Repo();
  }
}

class _Data {
  Future<dio.Response> category() {
    return _repo.data.category();
  }

  Future<dio.Response> filterCategory(String name) {
    return _repo.data.filterCategory(name);
  }
}
