import 'dart:math';
import 'package:flutter/material.dart';

class TestKeyPage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

final _random = Random();

class _HomePageState extends State<TestKeyPage> {
  var _items = [
    ListItem(title: "aaa", key: ValueKey<String>("aaa")),
    ListItem(title: "bbb", key: ValueKey<String>("bbb")),
    ListItem(title: "ccc", key: ValueKey<String>("ccc")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("key demo"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _items,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // 删除第一个元素
          _items.removeAt(0);
          setState(() {});
        },
      ),
    );
  }
}

/// 定义一个item
// class ListItem extends StatelessWidget {
//   final String title;
//   // color放在widget
//   final Color color = Color.fromARGB(
//       255, _random.nextInt(256), _random.nextInt(256), _random.nextInt(256));

//   ListItem({required this.title});
//   @override
//   Widget build(BuildContext context) {
//     print(this.title + 'build');
//     return Container(
//       alignment: Alignment.center,
//       child: Text(
//         this.title,
//         style: TextStyle(color: Colors.white, fontSize: 20),
//       ),
//       color: this.color,
//       width: 100,
//       height: 100,
//     );
//   }
// }

class ListItem extends StatefulWidget {
  final String title;

  ListItem({required this.title, Key? key}) : super(key: key);
  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  // color放在state
  final Color color = Color.fromARGB(
      255, _random.nextInt(256), _random.nextInt(256), _random.nextInt(256));

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        widget.title,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      color: this.color,
      width: 100,
      height: 100,
    );
  }
}
