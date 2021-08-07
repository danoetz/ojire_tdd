import 'package:flutter/material.dart';

// Light theme data
ThemeData lightThemeData() {
  return ThemeData.light().copyWith(
    primaryColor: Colors.blueGrey,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueGrey)),
      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueGrey.withOpacity(0.2))),
      labelStyle: TextStyle(color: Colors.blueGrey),
      suffixStyle: TextStyle(color: Colors.blueGrey),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blueGrey,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(),
    ),
  );
}

// Dark theme data
ThemeData darkThemeData() {
  return ThemeData.dark().copyWith(
    primaryColor: Colors.red,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white.withOpacity(0.5))),
      labelStyle: TextStyle(color: Colors.white),
      suffixStyle: TextStyle(color: Colors.red),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.redAccent,
      textTheme: ButtonTextTheme.accent,
      shape: RoundedRectangleBorder(),
    ),
  );
}
