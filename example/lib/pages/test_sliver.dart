import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliverPage extends StatelessWidget {
  const SliverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('sliver')),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
              pinned: false,
              expandedHeight: 250.0,
              flexibleSpace: Center(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  ClipRRect(
                    child: Image.asset(
                      'assets/images/photo.png',
                      width: 40,
                      height: 40,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  const Text('cxd')
                ]),
              )),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('Grid Item $index'),
                );
              },
              childCount: 20,
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('List Item $index'),
              );
            }, childCount: 10),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                height: 100,
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('List Item $index'),
              );
            }, childCount: 10),
          )
        ],
      ),
    );
  }
}
