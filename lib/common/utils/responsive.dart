import 'package:flutter/material.dart';

class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 600;

  static double getContentWidth(BuildContext context) =>
      isMobile(context) ? double.infinity : 600;
}
