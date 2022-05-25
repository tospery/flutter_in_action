import 'package:flutter/material.dart';
import 'dart:math' as math;

class TransformTestRoute extends StatelessWidget {
  const TransformTestRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(40),
          child: Container(
            color: Colors.black,
            child: Transform(
              alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
              transform: Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.deepOrange,
                child: const Text('Apartment for rent!'),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(40),
          child: Container(
            color: Colors.black,
            child: DecoratedBox(
              decoration: const BoxDecoration(color: Colors.red),
              //默认原点为左上角，左移20像素，向上平移5像素
              child: Transform.translate(
                offset: const Offset(-20.0, -5.0),
                child: const Text("Hello world"),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(40),
          child: Container(
            color: Colors.black,
            child: DecoratedBox(
              decoration: const BoxDecoration(color: Colors.red),
              child: Transform.rotate(
                //旋转90度
                angle: math.pi / 2,
                child: const Text("Hello world"),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(40),
          child: DecoratedBox(
              decoration: const BoxDecoration(color: Colors.red),
              child: Transform.scale(
                  scale: 1.5, //放大到1.5倍
                  child: const Text("Hello world"))),
        ),
        Padding(
          padding: const EdgeInsets.all(40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DecoratedBox(
                  decoration: const BoxDecoration(color: Colors.red),
                  child:
                      Transform.scale(scale: 1.5, child: const Text("Hello world"))),
              const Text(
                "你好",
                style: TextStyle(color: Colors.green, fontSize: 18.0),
              )
            ],
          ),
        ),
      ],
    );
  }
}
