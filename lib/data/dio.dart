import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as d;
import 'package:themealdb_app/common/constans/general.dart';
import 'package:themealdb_app/data/api.dart';
import 'package:themealdb_app/data/sp_data.dart';
import 'package:themealdb_app/model/app/singleton_model.dart';
import 'package:themealdb_app/page/home_page.dart';
import 'package:themealdb_app/tool/helper.dart';

class Dio {
  late d.Dio _dio;
  late Helper _helper;

  Dio({Map<String, dynamic>? headers}) {
    _dio = d.Dio();
    _helper = Helper();
    _dio.options = d.BaseOptions(
      baseUrl: API.baseUrl,
      connectTimeout: 20000,
      receiveTimeout: 20000,
      responseType: ResponseType.json,
      headers: headers ??
          {
            "Accept": "application/json",
            "Content-Type": "application/json",
          },
    );
    _dio.interceptors.add(
      d.InterceptorsWrapper(
          onRequest: (d.RequestOptions o, d.RequestInterceptorHandler h) =>
              h.next(o),
          onResponse: (d.Response r, d.ResponseInterceptorHandler h) =>
              h.next(r),
          onError: (d.DioError e, d.ErrorInterceptorHandler h) async {
            if (e.response?.statusCode == 401) {
              SPData.resetSP();
              _helper.backToRootPage(SingletonModel.shared.context);
              _helper.moveToPage(
                SingletonModel.shared.context,
                page: const HomePage(),
              );
              SingletonModel.shared.user = null;
              SingletonModel.shared.isLoggedIn = false;
            }
            return h.next(e);
          }),
    );
  }

  Future put({
    required String url,
    dynamic body,
    Map<String, dynamic>? param,
  }) async {
    try {
      return await _dio.put(
        url,
        queryParameters: param,
        data: body,
      );
    } on TimeoutException catch (e) {
      printLog(e);
      return Future.error(e);
    } on SocketException catch (e) {
      printLog(e);
      return Future.error(e);
    } on d.DioError catch (e) {
      printLog(e);
      return Future.error(e);
    }
  }

  Future post({
    required String url,
    dynamic body,
    Map<String, dynamic>? param,
  }) async {
    try {
      return await _dio.post(
        url,
        queryParameters: param,
        data: body,
      );
    } on TimeoutException catch (e) {
      printLog(e);
      return Future.error(e);
    } on SocketException catch (e) {
      printLog(e);
      return Future.error(e);
    } on d.DioError catch (e) {
      printLog(e);
      return Future.error(e);
    }
  }

  Future get({
    required String url,
    Map<String, dynamic>? param,
  }) async {
    try {
      return await _dio.get(
        url,
        queryParameters: param,
      );
    } on TimeoutException catch (e) {
      printLog(e);
      return Future.error(e);
    } on SocketException catch (e) {
      printLog(e);
      return Future.error(e);
    } on d.DioError catch (e) {
      printLog(e);
      return Future.error(e);
    }
  }

  Future delete({
    required String url,
    Map<String, dynamic>? param,
  }) async {
    try {
      return await _dio.delete(
        url,
        queryParameters: param,
      );
    } on TimeoutException catch (e) {
      printLog(e);
      return Future.error(e);
    } on SocketException catch (e) {
      printLog(e);
      return Future.error(e);
    } on d.DioError catch (e) {
      printLog(e);
      return Future.error(e);
    }
  }
}
