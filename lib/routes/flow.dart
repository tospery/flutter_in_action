import 'package:flutter/material.dart';

class FlowTestRoute extends StatelessWidget {
  const FlowTestRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: FlowTestDelegate(margin: const EdgeInsets.all(10.0)),
      children: <Widget>[
        Container(
          width: 80.0,
          height: 80.0,
          color: Colors.red,
        ),
        Container(
          width: 80.0,
          height: 80.0,
          color: Colors.green,
        ),
        Container(
          width: 80.0,
          height: 80.0,
          color: Colors.blue,
        ),
        Container(
          width: 80.0,
          height: 80.0,
          color: Colors.yellow,
        ),
        Container(
          width: 80.0,
          height: 80.0,
          color: Colors.brown,
        ),
        Container(
          width: 80.0,
          height: 80.0,
          color: Colors.purple,
        ),
      ],
    );
  }
}

class FlowTestDelegate extends FlowDelegate {
  EdgeInsets margin;

  FlowTestDelegate({this.margin = EdgeInsets.zero});

  double width = 0;
  double height = 0;

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i)!.width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i)!.height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i)!.width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // 指定Flow的大小，简单起见我们让宽度竟可能大，但高度指定为200，
    // 实际开发中我们需要根据子元素所占用的具体宽高来设置Flow大小
    return const Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
