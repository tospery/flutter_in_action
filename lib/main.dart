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
            title: const Text("基础组件"),
            children: _generateItem(context, [
              PageInfo("文本及样式", (ctx) => const TextRoute()),
            ]),
          ),
          ExpansionTile(
            title: const Text("布局类组件"),
            children: _generateItem(context, [
              PageInfo("尺寸布局组件（ConstrainedBox/SizedBox）",
                  (ctx) => const SizeLayoutRoute()),
              PageInfo("线性布局组件（Row/Column）", (ctx) => const LineLayoutRoute()),
              PageInfo("Column（一）", (ctx) => const Column1Route()),
              PageInfo("Column（二）", (ctx) => const Column2Route()),
              PageInfo("Column（三）", (ctx) => const Column3Route()),
              PageInfo("Column（四）", (ctx) => const Column4Route()),
              PageInfo("弹性布局组件（Flex）", (ctx) => const FlexTestRoute()),
              PageInfo("流式布局组件（Wrap）", (ctx) => const WrapTestRoute()),
              PageInfo("流式布局组件（Flow）", (ctx) => const FlowTestRoute()),
              PageInfo("层叠布局组件（Stack/Positioned）1",
                  (ctx) => const StackTest1Route()),
              PageInfo("层叠布局组件（Stack/Positioned）2",
                  (ctx) => const StackTest2Route()),
              PageInfo("对齐布局（Align）", (ctx) => const AlignTestRoute()),
              PageInfo("居中对齐（Center）", (ctx) => const CenterTestRoute()),
              PageInfo("布局构建器（LayoutBuilder）", (ctx) => const LayoutBuilderTestRoute()),
            ]),
          ),
          ExpansionTile(
            title: const Text("容器类组件"),
            children: _generateItem(context, [
              PageInfo("边距（Padding）", (ctx) => const PaddingTestRoute()),
              PageInfo("装饰（DecoratedBox）", (ctx) => const DecoratedBoxTestRoute()),
              PageInfo("变换（Transform）", (ctx) => const TransformTestRoute()),
              PageInfo("旋转（RotatedBox）", (ctx) => const RotatedBoxTestRoute()),
              PageInfo("容器（Container）", (ctx) => const ContainerTestRoute()),
              PageInfo("裁剪（Clip）", (ctx) => const ClipTestRoute()),
              PageInfo("自定义裁剪组件（CustomClipper）", (ctx) => const CustomClipperTestRoute()),
              PageInfo("溢出示例", (ctx) => const OverflowTestRoute()),
              PageInfo("自适应盒子（FittedBox）", (ctx) => const FittedBoxTestRoute()),
              PageInfo("单行自适应容器组件", (ctx) => const SingleLineFittedBoxTestRoute()),
            ]),
          ),
        ],
      ),
    );
  }
}

