import 'dart:io';

import 'package:example/widgets/c_indicator.dart';
import 'package:example/widgets/c_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RefreshPage extends StatefulWidget {
  const RefreshPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RefreshState();
  }
}

class RefreshState extends State<RefreshPage> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: RefreshIndicator(
          onRefresh: () {
            // ignore: void_checks
            return Future.value(true);
          },
          child: SingleChildScrollView(
              // physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: SizedBox(
                  height: height,
                  width: width,
                  child: const WebView(
                    initialUrl: 'https://www.baidu.com',
                    javascriptMode: JavascriptMode.unrestricted,
                  )))),
    );
  }
}
