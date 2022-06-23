import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:themealdb_app/common/styles/color.dart';

ThemeData tdMain(BuildContext context) => ThemeData(
      primarySwatch: mSecondary,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: hBackground,
      textTheme: GoogleFonts.montserratTextTheme(
        Theme.of(context).textTheme,
      ),
      primaryColor: hSecondary,
      primaryColorDark: hPrimary,
      primaryTextTheme: TextTheme(headline6: TextStyle(color: hPrimary)),
      dividerColor: hSecondary,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        iconTheme: IconThemeData(color: hPrimary),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: const TextStyle(color: Colors.black),
        hintStyle: TextStyle(color: hPrimary),
        hoverColor: Colors.white,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: Colors.black,
        cursorColor: Colors.black,
      ),
    );
