import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CFutureBuilder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CFutureState();
  }
}

class CFutureState extends State<CFutureBuilder> {
  Future<String> mockNetwork() {
    return Future.delayed(Duration(seconds: 2), () => "111");
    // return Future.error('111');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<String>(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('error');
            } else {
              return Text(snapshot.data ?? '1');
            }
          } else {
            return const CircularProgressIndicator();
          }
        },
        future: mockNetwork(),
      ),
    );
  }
}
