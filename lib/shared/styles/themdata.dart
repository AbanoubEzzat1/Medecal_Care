import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medical_app/shared/styles/colors.dart';

ThemeData lightThem = ThemeData(
  primarySwatch: Colors.blue, // for circulerProgressIndecator
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black),
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      height: 1,
      fontSize: 24,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.black,
    ),
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.grey,
    backgroundColor: Colors.white,
    elevation: 20,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: Colors.black,
    ),
  ),
);
