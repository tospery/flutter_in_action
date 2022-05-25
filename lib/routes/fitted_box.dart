import 'package:flutter/material.dart';

class FittedBoxTestRoute extends StatelessWidget {
  const FittedBoxTestRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          wContainer1(BoxFit.none),
          const Text('Wendux'),
          wContainer1(BoxFit.contain),
          const Text('Flutter中国'),
          wContainer2(BoxFit.none),
          const Text('Wendux'),
          wContainer2(BoxFit.contain),
          const Text('Flutter中国'),
        ],
      ),
    );
  }
}

Widget wContainer1(BoxFit boxFit) {
  return Container(
    width: 50,
    height: 50,
    color: Colors.red,
    child: FittedBox(
      fit: boxFit,
      // 子容器超过父容器大小
      child: Container(width: 60, height: 70, color: Colors.blue),
    ),
  );
}

Widget wContainer2(BoxFit boxFit) {
  return ClipRect(
    // 将超出子组件布局范围的绘制内容剪裁掉
    child: Container(
      width: 50,
      height: 50,
      color: Colors.red,
      child: FittedBox(
        fit: boxFit,
        child: Container(width: 60, height: 70, color: Colors.blue),
      ),
    ),
  );
}
