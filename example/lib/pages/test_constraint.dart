import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestConstraintPage extends StatelessWidget {
  const TestConstraintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 70,
        minHeight: 70,
        maxWidth: 150,
        maxHeight: 150,
      ),
      child: Container(color: Colors.black, width: 10, height: 10),
    ));
  }
}
