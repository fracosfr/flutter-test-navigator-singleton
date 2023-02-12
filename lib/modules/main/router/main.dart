import 'package:flutter/material.dart';
import 'package:fracosfr/modules/blog/router/blog.dart';
import 'package:fracosfr/router/route_configuration.dart';
import 'package:fracosfr/modules/main/ui/page_test.dart';

enum ModulePage {
  home,
  blog,
  contact,
  error,
}

class MainRouteConfiguration extends RouteConfiguration {
  static MainRouteConfiguration? _instance;

  factory MainRouteConfiguration() {
    _instance ??= MainRouteConfiguration._internal();
    return _instance!;
  }

  /// Internal constructor
  MainRouteConfiguration._internal() {
    BlogRouteConfiguration().addListener(() {
      notifyListeners();
    });
  }

  @override
  List<Page> get pages => _getPages();

  ModulePage _module = ModulePage.home;

  @override
  void parseRoute(List<String> segments, String? query) {
    _module = ModulePage.home;

    if (segments.isNotEmpty) {
      _module = ModulePage.error;
      switch (segments.first) {
        case "contact":
          _module = ModulePage.contact;
          break;
        case "blog":
          BlogRouteConfiguration().parseRoute(segments.sublist(1), query);
          _module = ModulePage.blog;
          break;
      }
    }
  }

  @override
  String restoreRoute() {
    if (_module == ModulePage.error) return "";
    if (_module == ModulePage.home) return "";

    if (_module == ModulePage.blog) {
      return "/blog${BlogRouteConfiguration().restoreRoute()}";
    }

    return "/${MainRouteConfiguration()._module.name}";
  }

  @override
  bool onBackButtonTouched(dynamic result) {
    if (_module == ModulePage.blog) {
      if (BlogRouteConfiguration().onBackButtonTouched(result)) return true;
    }
    _module = ModulePage.home;
    notifyListeners();
    return true;
  }

  List<Page> _getPages() {
    List<Page> pages = [];

    switch (_module) {
      case ModulePage.contact:
        pages.add(const MaterialPage(child: PageTest("contact")));
        break;
      case ModulePage.error:
        pages.add(const MaterialPage(child: PageTest("error")));
        break;
      default:
        pages.add(const MaterialPage(child: PageTest("accueil")));
        break;
    }

    if (_module == ModulePage.blog) {
      pages.addAll(BlogRouteConfiguration().pages);
    }

    return pages;
  }

  void changeModule(ModulePage modulePage) {
    _module = modulePage;
    notifyListeners();
  }
}
