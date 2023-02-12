import 'package:fracosfr/modules/blog/router/blog_router.dart';
import 'package:fracosfr/modules/main/router/main.dart';

class MainRouter {
  static void openContactPage() {
    MainRouteConfiguration().changeModule(ModulePage.contact);
  }

  static void openHomePage() {
    MainRouteConfiguration().changeModule(ModulePage.home);
  }

  static void openBlogPage() {
    BlogRouter.openHome();
  }

  static void openErrorPage() {
    MainRouteConfiguration().changeModule(ModulePage.error);
  }
}
