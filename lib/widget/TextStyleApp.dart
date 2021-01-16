import 'package:flutter/material.dart';

TextStyle boldStyle(
    {@required Color color, @required double fontSize, TextDecoration line}) {
  return TextStyle(
      color: color,
      fontSize: fontSize,
      decoration: line ?? TextDecoration.none);
}

TextStyle regularStyle(
    {@required Color color, @required double fontSize, TextDecoration line}) {
  return TextStyle(
      color: color,
      fontSize: fontSize,
      decoration: line ?? TextDecoration.none);
}
