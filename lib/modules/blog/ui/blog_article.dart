import 'package:flutter/material.dart';

class BlogArticlePage extends StatelessWidget {
  const BlogArticlePage(this.idArticle, {super.key});
  final String idArticle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mon Article $idArticle")),
    );
  }
}
