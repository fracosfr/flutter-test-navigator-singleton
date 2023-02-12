import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fracosfr/modules/blog/router/blog_router.dart';

class BlogListPage extends StatelessWidget {
  const BlogListPage({super.key});

  String generateRandomString(int len) {
    var r = Random();
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => chars[r.nextInt(chars.length)]).join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mon blog")),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          final String id = generateRandomString(Random().nextInt(6) + 8);
          return ListTile(
            title: Text("Un article $id"),
            onTap: () => BlogRouter.openArticle(id),
          );
        },
      ),
    );
  }
}
