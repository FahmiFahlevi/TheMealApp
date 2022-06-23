import 'package:flutter/material.dart';
import 'package:themealdb_app/model/app/category_model.dart';
import 'package:themealdb_app/model/user_model.dart';

export 'package:themealdb_app/model/user_model.dart';

class SingletonModel {
  static final SingletonModel _singleton = SingletonModel._internal();

  factory SingletonModel() {
    return _singleton;
  }

  SingletonModel._internal();

  static SingletonModel withContext(BuildContext context) {
    _singleton.context = context;
    return _singleton;
  }

  static SingletonModel get shared => _singleton;

  late bool isLoggedIn;
  UserModel? user;
  late BuildContext context;
  List<Category>? categories;

}