import 'package:flutter/material.dart';

class Styles {
  ///static object to use one textStyle across the application
  ///with color and fontSize of your choice
  ///in class [Styles]
  ///uses Fugaz One fontFamily
  static TextStyle textStyleFugazOne(BuildContext context,
      {required double size, required Color color}) {
    return TextStyle(
        color: color,
        fontFamily: 'Fugaz One',
        fontSize: (size / 720) * MediaQuery.of(context).size.height);
  }
  ///static object to use one textStyle across the application
  ///with color and fontSize of your choice
  ///in class [Styles]
  ///uses Poppins fontFamily
   static TextStyle textStylePoppins(BuildContext context,
      {required double size, required Color color}) {
    return TextStyle(
        color: color,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w100,
        fontSize: (size / 720) * MediaQuery.of(context).size.height);
  }
}
