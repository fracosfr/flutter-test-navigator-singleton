import 'package:flutter/material.dart';
import 'package:fracosfr/modules/main/router/main.dart';
import 'package:fracosfr/router/route_configuration.dart';
import 'package:fracosfr/modules/blog/ui/blog_article.dart';
import 'package:fracosfr/modules/blog/ui/blog_list.dart';

enum ModuleBlogPage {
  liste,
  article,
}

class BlogRouteConfiguration extends RouteConfiguration {
  static BlogRouteConfiguration? _instance;

  factory BlogRouteConfiguration() {
    _instance ??= BlogRouteConfiguration._internal();
    return _instance!;
  }

  BlogRouteConfiguration._internal();

  ModuleBlogPage _blogPage = ModuleBlogPage.liste;
  String? _idArticle;

  @override
  List<Page> get pages => _getPages();

  void changeModule(ModuleBlogPage moduleBlogPage, {String? id}) {
    MainRouteConfiguration().changeModule(ModulePage.blog);
    _blogPage = moduleBlogPage;
    _idArticle = id;
    notifyListeners();
  }

  @override
  void parseRoute(List<String> segments, String? query) {
    _blogPage = ModuleBlogPage.liste;
    _idArticle = null;
    if (segments.length >= 2) {
      if (segments.first == "article") {
        _blogPage = ModuleBlogPage.article;
        _idArticle = segments[1];
      }
    }
  }

  @override
  String restoreRoute() {
    if (_blogPage == ModuleBlogPage.article && _idArticle != null) {
      return "/article/$_idArticle";
    }
    return "";
  }

  @override
  bool onBackButtonTouched(dynamic result) {
    if (_blogPage == ModuleBlogPage.liste) return false;
    _blogPage = ModuleBlogPage.liste;
    notifyListeners();
    return true;
  }

  List<Page> _getPages() {
    List<Page> pages = [];

    pages.add(const MaterialPage(child: BlogListPage()));

    if (_blogPage == ModuleBlogPage.article && _idArticle != null) {
      pages.add(MaterialPage(child: BlogArticlePage(_idArticle ?? "")));
    }

    return pages;
  }
}
