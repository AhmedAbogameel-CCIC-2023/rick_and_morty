import 'package:flutter/material.dart';

class RouteUtils {
  static Future<dynamic> push({
    required BuildContext context,
    required Widget view,
  }) {
    return Navigator.of(context).push(
      _getRoute(view),
    );
  }

  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  static Future<dynamic> pushReplacement({
    required BuildContext context,
    required Widget view,
  }) {
    return Navigator.of(context).pushReplacement(
      _getRoute(view),
    );
  }

  static Future<dynamic> pushAndPopAll({
    required BuildContext context,
    required Widget view,
  }) {
    return Navigator.of(context).pushAndRemoveUntil(
      _getRoute(view),
          (route) => false,
    );
  }

  static Route _getRoute(Widget view) {
    return MaterialPageRoute(
      builder: (context) => view,
    );
  }

}