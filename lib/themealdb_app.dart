import 'package:themealdb_app/common/configs.dart';
import 'package:themealdb_app/common/constans.dart';
import 'package:themealdb_app/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:themealdb_app/page/category_page.dart';
import 'package:themealdb_app/page/home_page.dart';

class TheMealDBApp extends StatelessWidget {
  const TheMealDBApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kSAppName,
      theme: tdMain(context),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: kLDelegates,
      supportedLocales: kLSupports,
    );
  }
}
