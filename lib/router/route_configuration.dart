import 'package:flutter/material.dart';

abstract class RouteConfiguration extends ChangeNotifier {
  void parseRoute(List<String> segments, String? query);
  String restoreRoute();
  bool onBackButtonTouched(dynamic result);
  List<Page> get pages;
}
