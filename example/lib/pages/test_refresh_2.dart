import 'dart:io';

import 'package:example/widgets/c_indicator.dart';
import 'package:example/widgets/c_refresh_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Refresh2Page extends StatefulWidget {
  const Refresh2Page({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RefreshState();
  }
}

class RefreshState extends State<Refresh2Page> {
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
    return const Scaffold(
      body: WebView(
        initialUrl: 'https://www.baidu.com',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
