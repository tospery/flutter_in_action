import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextRoute extends StatefulWidget {
  const TextRoute({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TextRouteState createState() => _TextRouteState();
}

class _TextRouteState extends State<TextRoute> {
  late GestureRecognizer _tapRecognizer;

  @override
  void initState() {
    _tapRecognizer = TapGestureRecognizer();
    super.initState();
  }

  @override
  void dispose() {
    _tapRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const Text(
            "Hello world",
            textAlign: TextAlign.center,
          ),
          Text(
            "Hello world! I'm Jack. " * 4,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const Text(
            "Hello world",
            textScaleFactor: 1.5,
          ),
          Text(
            "Hello world " * 6, //字符串重复六次
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
