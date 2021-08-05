import 'package:flutter/material.dart';

final theme = ThemeData(
  primarySwatch: Colors.indigo,
  fontFamily: "Barlow",
  scaffoldBackgroundColor: Colors.grey.shade200,
  cardTheme: CardTheme(
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
  ),
  appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black54),
    backgroundColor: Colors.transparent,
    elevation: 0,
  ),
  inputDecorationTheme: InputDecorationTheme(),
);
