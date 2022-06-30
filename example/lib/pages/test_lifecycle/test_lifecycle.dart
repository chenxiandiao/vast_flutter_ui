import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestLifeCyclePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TestLifeCycleState();
  }
}

class TestLifeCycleState extends State<TestLifeCyclePage> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
          onPressed: () {
            setState(() {});
          },
          child: Text('点击')),
      ChildrenWidget(),
    ]);
  }

  @override
  void didUpdateWidget(covariant TestLifeCyclePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget TestLifeCycleState');
  }
}

class ChildrenWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChildrenState();
  }
}

class ChildrenState extends State<ChildrenWidget> {
  @override
  Widget build(BuildContext context) {
    print('build children');
    return Text('children');
  }

  @override
  void didUpdateWidget(covariant ChildrenWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    // print('cxd:' + (oldWidget.key?.toString() ?? ''));
    // print('cxd:' + (oldWidget.runtimeType?.toString() ?? ''));
    print('didUpdateWidget children');
  }
}
