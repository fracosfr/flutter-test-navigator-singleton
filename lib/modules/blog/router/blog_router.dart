import 'package:fracosfr/modules/blog/router/blog.dart';
import 'package:fracosfr/router/route_history.dart';

class BlogRouter {
  static openHome() {
    RouteHistory.clear();
    BlogRouteConfiguration().changeModule(ModuleBlogPage.liste);
  }

  static openArticle(String id, {bool toHistory = false}) {
    if (toHistory) RouteHistory.add();
    BlogRouteConfiguration().changeModule(ModuleBlogPage.article, id: id);
  }
}
