import 'package:flutter/material.dart';

class NavigationPage {
  static void navigateToPage(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }
}
