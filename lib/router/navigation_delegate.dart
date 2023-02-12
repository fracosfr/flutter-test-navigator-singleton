import 'package:flutter/material.dart';
import 'package:fracosfr/modules/main/router/main.dart';
import 'package:fracosfr/router/navigation_path.dart';
import 'package:fracosfr/router/route_history.dart';

class NavigationDelegate extends RouterDelegate<NavigationPath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<NavigationPath> {
  MainRouteConfiguration mainRouteConfiguration = MainRouteConfiguration();
  bool directusLoaded = false;

  NavigationDelegate() {
    mainRouteConfiguration.addListener(() {
      notifyListeners();
    });
  }

  @override
  NavigationPath? get currentConfiguration => NavigationPath();

  @override
  GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    List<Page<dynamic>> pagesList = [];

    RouteHistory.setCurrent(MainRouteConfiguration().restoreRoute());

    pagesList.addAll(MainRouteConfiguration().pages);

    return Navigator(
      pages: pagesList,
      onPopPage: (route, result) {
        if (RouteHistory.isNotEmpty) {
          final uri = Uri.parse(RouteHistory.last);
          MainRouteConfiguration().parseRoute(uri.pathSegments, uri.query);
          RouteHistory.removeLast();
          notifyListeners();
          return false;
        } else {
          if (!route.didPop(result)) return false;
          return onBackButtonTouched(result);
        }
      },
    );
  }

  bool onBackButtonTouched(dynamic result) {
    return MainRouteConfiguration().onBackButtonTouched(result);
  }

  @override
  Future<void> setNewRoutePath(NavigationPath configuration) async {}
}
