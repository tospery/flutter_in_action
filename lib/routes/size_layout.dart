import 'package:flutter/material.dart';

class SizeLayoutRoute extends StatelessWidget {
  const SizeLayoutRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget redBox = const DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('尺寸布局容器'),
        actions: const <Widget>[
          UnconstrainedBox(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(Colors.white70),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ConstrainedBox(
              constraints: const BoxConstraints(
                  minWidth: double.infinity, //宽度尽可能大
                  minHeight: 50.0 //最小高度为50像素
                  ),
              // ignore: sized_box_for_whitespace
              child: Container(height: 5.0, child: redBox),
            ),
            SizedBox(width: 80.0, height: 80.0, child: redBox),
            ConstrainedBox(
              constraints:
                  const BoxConstraints(minWidth: 60.0, minHeight: 60.0),
              //父
              child: ConstrainedBox(
                constraints:
                    const BoxConstraints(minWidth: 90.0, minHeight: 20.0),
                //子
                child: redBox,
              ),
            ),
            ConstrainedBox(
              constraints:
                  const BoxConstraints(minWidth: 90.0, minHeight: 20.0),
              child: ConstrainedBox(
                constraints:
                    const BoxConstraints(minWidth: 60.0, minHeight: 60.0),
                child: redBox,
              ),
            ),
            ConstrainedBox(
                constraints:
                    const BoxConstraints(minWidth: 60.0, minHeight: 100.0), //父
                child: UnconstrainedBox(
                  //“去除”父级限制
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                        minWidth: 90.0, minHeight: 20.0), //子
                    child: redBox,
                  ),
                )),
            AspectRatio(
              aspectRatio: 3, //宽是高的三倍
              child: redBox,
            ),
          ]
              .map((e) => Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: e,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
