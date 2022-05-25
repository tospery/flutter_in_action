import 'package:flutter/material.dart';

class SingleLineFittedBoxTestRoute extends StatelessWidget {
  const SingleLineFittedBoxTestRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // wRow(' 90000000000000000 '),
          SingleLineFittedBox(child: wRow(' 90000000000000000 ')),
          wRow(' 800 '),
          SingleLineFittedBox(child: wRow(' 800 ')),
        ]
            .map((e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: e,
                ))
            .toList(),
      ),
    );
  }
}

Widget wRow(String text) {
  Widget child = Text(text);
  child = Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [child, child, child],
  );
  return child;
}

class SingleLineFittedBox extends StatelessWidget {
  const SingleLineFittedBox({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return FittedBox(
          child: ConstrainedBox(
            constraints: constraints.copyWith(
              minWidth: constraints.maxWidth,
              maxWidth: double.infinity,
              //maxWidth: constraints.maxWidth
            ),
            child: child,
          ),
        );
      },
    );
  }
}
