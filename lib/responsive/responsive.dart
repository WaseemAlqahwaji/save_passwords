import 'package:flutter/material.dart';

class ResponsiveWidgets
{
  static getScreenHeight(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return screenHeight - statusBarHeight;
  }
}