import 'package:flutter/material.dart';

class PageScaffold extends StatelessWidget {
  PageScaffold({required this.title, required this.body, required this.padding});

  final String title;
  final Widget body;
  final bool padding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: padding
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: body,
            )
          : body,
    );
  }
}

class PageInfo {
  PageInfo(
    this.title,
    this.builder, {
    this.withScaffold = true,
    this.padding = true,
  });

  String title;
  WidgetBuilder builder;
  bool withScaffold;
  bool padding;
}
