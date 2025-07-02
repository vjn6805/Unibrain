import 'package:flutter/material.dart';

/// Light & Dark Outlined Button Themes
class TOutlinedButtonTheme {
  TOutlinedButtonTheme._(); // To avoid creating instances

  /// Light Theme
  static final OutlinedButtonThemeData lightOutlinedButtonTheme =
  OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.black,
      side: const BorderSide(color: Colors.greenAccent),
      textStyle: const TextStyle(
          fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      backgroundColor: Colors.white,
      overlayColor: Colors.blue.withOpacity(0.1),
    ),
  );

  /// Dark Theme
  static final OutlinedButtonThemeData darkOutlinedButtonTheme =
  OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.white,
      side: const BorderSide(color: Colors.greenAccent),
      textStyle: const TextStyle(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      backgroundColor: Colors.black,
      overlayColor: Colors.blueAccent.withOpacity(0.1),
    ),
  );
}