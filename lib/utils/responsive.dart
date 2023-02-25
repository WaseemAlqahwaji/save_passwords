import 'package:flutter/material.dart';

class Responsive {
  static getScreenHeight({
    required BuildContext context,
  }) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return screenHeight - statusBarHeight;
  }

  static getScreenWidth({
    required BuildContext context,
  }) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth;
  }
}
