import 'package:flutter/material.dart';
import 'package:fracosfr/modules/blog/router/blog_router.dart';
import 'package:fracosfr/modules/main/router/main_router.dart';

class PageTest extends StatelessWidget {
  const PageTest(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title.toUpperCase()),
      ),
      body: Column(children: [
        Row(
          children: [
            const TextButton(
              onPressed: MainRouter.openHomePage,
              child: Text("Accueil"),
            ),
            const TextButton(
              onPressed: MainRouter.openContactPage,
              child: Text("Contact"),
            ),
            const TextButton(
              onPressed: MainRouter.openBlogPage,
              child: Text("Blog"),
            ),
            TextButton(
              onPressed: () => BlogRouter.openArticle("test", toHistory: true),
              child: const Text("Article test"),
            ),
          ],
        ),
        Expanded(
            child: Center(
                child: Text(
          "Module $title.",
          style: Theme.of(context).textTheme.displayLarge,
        ))),
      ]),
    );
  }
}
