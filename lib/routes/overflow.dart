import 'package:flutter/material.dart';

class OverflowTestRoute extends StatelessWidget {
  const OverflowTestRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Row(children: [Text('xx' * 30)]), //文本长度超出 Row 的最大宽度会溢出
    );
  }
}
