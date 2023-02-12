import 'package:flutter/material.dart';
import 'package:fracosfr/modules/main/router/main.dart';
import 'package:fracosfr/router/navigation_path.dart';
import 'package:fracosfr/router/route_history.dart';

class NavigationRouteParser extends RouteInformationParser<NavigationPath> {
  @override
  Future<NavigationPath> parseRouteInformation(
      RouteInformation routeInformation) {
    final uri = Uri.parse(routeInformation.location ?? "/");
    MainRouteConfiguration().parseRoute(uri.pathSegments, uri.query);
    RouteHistory.setCurrent(routeInformation.location ?? "/");
    if (routeInformation.location != "/") RouteHistory.add();
    return Future.value(NavigationPath());
  }

  @override
  RouteInformation? restoreRouteInformation(NavigationPath configuration) {
    return RouteInformation(location: MainRouteConfiguration().restoreRoute());
  }
}
