import 'package:flutter/material.dart';
import 'page_scaffold.dart';
import 'routes/column.dart';
import 'routes/flex.dart';
import 'routes/flow.dart';
import 'routes/line_layout.dart';
import 'routes/size_layout.dart';
import 'routes/stack.dart';
import 'routes/text.dart';
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
              PageInfo("尺寸布局容器（ConstrainedBox/SizedBox）", (ctx) => const SizeLayoutRoute()),
              PageInfo("线性布局容器（Row/Column）", (ctx) => const LineLayoutRoute()),
              PageInfo("Column（一）", (ctx) => const Column1Route()),
              PageInfo("Column（二）", (ctx) => const Column2Route()),
              PageInfo("Column（三）", (ctx) => const Column3Route()),
              PageInfo("Column（四）", (ctx) => const Column4Route()),
              PageInfo("弹性布局容器（Flex）", (ctx) => const FlexTestRoute()),
              PageInfo("流式布局容器（Wrap）", (ctx) => const WrapTestRoute()),
              PageInfo("流式布局容器（Flow）", (ctx) => const FlowTestRoute()),
              PageInfo("层叠布局容器（Stack/Positioned）1", (ctx) => const StackTest1Route()),
              PageInfo("层叠布局容器（Stack/Positioned）2", (ctx) => const StackTest2Route()),
            ]),
          ),
        ],
      ),
    );
  }
}
