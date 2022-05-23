import 'package:flutter/material.dart';

class Column1Route extends StatelessWidget {
  const Column1Route({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const <Widget>[
        Text("hi"),
        Text("world"),
      ],
    );
  }
}

class Column2Route extends StatelessWidget {
  const Column2Route({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: double.infinity),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Text("hi"),
          Text("world"),
        ],
      ),
    );
  }
}

class Column3Route extends StatelessWidget {
  const Column3Route({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
          children: <Widget>[
            Container(
              color: Colors.red,
              child: Column(
                mainAxisSize: MainAxisSize.max, //无效，内层Colum高度为实际高度
                children: const <Widget>[
                  Text("hello world "),
                  Text("I am Jack "),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Column4Route extends StatelessWidget {
  const Column4Route({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, //垂直方向居中对齐
                  children: const <Widget>[
                    Text("hello world "),
                    Text("I am Jack "),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
