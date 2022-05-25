import 'package:flutter/material.dart';

class CustomClipperTestRoute extends StatelessWidget {
  const CustomClipperTestRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 头像
    Widget avatar = Image.asset("res/image/avatar.png", width: 60.0);
    return DecoratedBox(
      decoration: const BoxDecoration(color: Colors.red),
      child: ClipRect(
          clipper: MyClipper(), //使用自定义的clipper
          child: avatar),
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) => const Rect.fromLTWH(10.0, 15.0, 40.0, 30.0);

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}
