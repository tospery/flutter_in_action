import 'package:flutter/material.dart';
import 'page_scaffold.dart';
import 'routes/align.dart';
import 'routes/center.dart';
import 'routes/clip.dart';
import 'routes/column.dart';
import 'routes/container.dart';
import 'routes/custom_clipper.dart';
import 'routes/decorated_box.dart';
import 'routes/fitted_box.dart';
import 'routes/flex.dart';
import 'routes/flow.dart';
import 'routes/layout_builder.dart';
import 'routes/line_layout.dart';
import 'routes/overflow.dart';
import 'routes/padding.dart';
import 'routes/rotated_box.dart';
import 'routes/single_line_fitted_box.dart';
import 'routes/size_layout.dart';
import 'routes/stack.dart';
import 'routes/text.dart';
import 'routes/transform.dart';
import 'routes/wrap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _openPage(BuildContext context, PageInfo page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      if (!page.withScaffold) {
        return page.builder(context);
      }
      return PageScaffold(
        title: page.title,
        body: page.builder(context),
        padding: page.padding,
      );
    }));
  }

  List<Widget> _generateItem(BuildContext context, List<PageInfo> children) {
    return children.map<Widget>((page) {
      return ListTile(
        title: Text(page.title),
        trailing: const Icon(Icons.keyboard_arrow_right),
        onTap: () => _openPage(context, page),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          ExpansionTile(
            title: const Text("????????????"),
            children: _generateItem(context, [
              PageInfo("???????????????", (ctx) => const TextRoute()),
            ]),
          ),
          ExpansionTile(
            title: const Text("???????????????"),
            children: _generateItem(context, [
              PageInfo("?????????????????????ConstrainedBox/SizedBox???",
                  (ctx) => const SizeLayoutRoute()),
              PageInfo("?????????????????????Row/Column???", (ctx) => const LineLayoutRoute()),
              PageInfo("Column?????????", (ctx) => const Column1Route()),
              PageInfo("Column?????????", (ctx) => const Column2Route()),
              PageInfo("Column?????????", (ctx) => const Column3Route()),
              PageInfo("Column?????????", (ctx) => const Column4Route()),
              PageInfo("?????????????????????Flex???", (ctx) => const FlexTestRoute()),
              PageInfo("?????????????????????Wrap???", (ctx) => const WrapTestRoute()),
              PageInfo("?????????????????????Flow???", (ctx) => const FlowTestRoute()),
              PageInfo("?????????????????????Stack/Positioned???1",
                  (ctx) => const StackTest1Route()),
              PageInfo("?????????????????????Stack/Positioned???2",
                  (ctx) => const StackTest2Route()),
              PageInfo("???????????????Align???", (ctx) => const AlignTestRoute()),
              PageInfo("???????????????Center???", (ctx) => const CenterTestRoute()),
              PageInfo("??????????????????LayoutBuilder???", (ctx) => const LayoutBuilderTestRoute()),
            ]),
          ),
          ExpansionTile(
            title: const Text("???????????????"),
            children: _generateItem(context, [
              PageInfo("?????????Padding???", (ctx) => const PaddingTestRoute()),
              PageInfo("?????????DecoratedBox???", (ctx) => const DecoratedBoxTestRoute()),
              PageInfo("?????????Transform???", (ctx) => const TransformTestRoute()),
              PageInfo("?????????RotatedBox???", (ctx) => const RotatedBoxTestRoute()),
              PageInfo("?????????Container???", (ctx) => const ContainerTestRoute()),
              PageInfo("?????????Clip???", (ctx) => const ClipTestRoute()),
              PageInfo("????????????????????????CustomClipper???", (ctx) => const CustomClipperTestRoute()),
              PageInfo("????????????", (ctx) => const OverflowTestRoute()),
              PageInfo("??????????????????FittedBox???", (ctx) => const FittedBoxTestRoute()),
              PageInfo("???????????????????????????", (ctx) => const SingleLineFittedBoxTestRoute()),
            ]),
          ),
        ],
      ),
    );
  }
}

