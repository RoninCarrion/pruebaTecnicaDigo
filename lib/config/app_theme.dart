import 'package:flutter/material.dart';

class AppTheme {

  ThemeData get theme => ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15)
      )
    )
    
  );
}