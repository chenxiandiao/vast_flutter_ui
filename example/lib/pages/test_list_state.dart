import 'package:flutter/cupertino.dart';

class ListStatePage extends StatefulWidget {
  // final list = [1,2,3,4,5];
  String? title;

  ListStatePage({Key? key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ListState();
  }
}

class ListState extends State<ListStatePage> {
  @override
  Widget build(BuildContext context) {
    print('build' + widget.title!);
    return GestureDetector(
      child: Text(widget.title!),
      onTap: () {
        setState(() {
          widget.title = '222';
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    print('initState' + widget.title!);
  }
}

// ignore: must_be_immutable
// class ListStatePage extends StatelessWidget {
//   // final list = [1,2,3,4,5];
//   String? title;

//   ListStatePage({Key? key, this.title}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Text(title ?? "123");
//   }
// }
