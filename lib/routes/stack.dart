import 'package:flutter/material.dart';

class StackTest1Route extends StatelessWidget {
  const StackTest1Route({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Stack(
        alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
        children: <Widget>[
          Container(
            color: Colors.red,
            child: const Text("Hello world",
                style: TextStyle(color: Colors.white)),
          ),
          const Positioned(
            left: 18.0,
            child: Text("I am Jack"),
          ),
          const Positioned(
            top: 18.0,
            child: Text("Your friend"),
          )
        ],
      ),
    );
  }
}

class StackTest2Route extends StatelessWidget {
  const StackTest2Route({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand, //未定位widget占满Stack整个空间
        children: <Widget>[
          const Positioned(
            left: 18.0,
            child: Text("I am Jack"),
          ),
          Container(
            color: Colors.red,
            child: const Text("Hello world",
                style: TextStyle(color: Colors.white)),
          ),
          const Positioned(
            top: 18.0,
            child: Text("Your friend"),
          )
        ],
      ),
    );
  }
}
