import 'package:example/models/speed_info.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ListState();
  }
}

class _ListState extends State<ListPage> {
  List<Speed> datas = [];
  List<ListItem> items = [];

  @override
  void initState() {
    super.initState();
    datas.add(Header(type: 1, title: '头部'));
    for (int i = 0; i < 10; i++) {
      datas.add(Content(type: 2, content: '内容区域'));
    }
    datas.add(Footer(type: 3, title: '头部'));

    for (var element in datas) {
      if (element.type == 1) {
        items.add(HeadingItem('头部'));
      } else if (element.type == 2) {
        items.add(HeadingItem('内容区域'));
      } else {
        items.add(HeadingItem('尾部'));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('长列表'),
      ),
      body: ListView.builder(
        // Let the ListView know how many items it needs to build.
        itemCount: items.length,
        // Provide a builder function. This is where the magic happens.
        // Convert each item into a widget based on the type of item it is.
        itemBuilder: (context, index) {
          final item = items[index];

          return item.buildWidget(context);
        },
      ),
    );
  }
}

/// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildWidget(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildWidget(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headline5,
    );
  }
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildWidget(BuildContext context) {
    return Text(
      body,
      style: Theme.of(context).textTheme.headline5,
    );
  }
}
