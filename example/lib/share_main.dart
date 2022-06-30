import 'package:flutter/material.dart';
import 'package:flutter_umeng_ushare/flutter_umeng_ushare.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '111',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UMengShare.initUMConfigure(
        '62bd91ed88ccdf4b7eb62e96', 'ltd.vastchain.vast_box_app');
    UMengShare.initPlatformConfig(
        UMPlatform.QQ, "1112138343", "kUfY4qB6QcqHKBAe", "universal link");
    UMengShare.initPlatformConfig(UMPlatform.Wechat, "wx069a0a9508ff7905",
        "88b5125fb90d0193baad393fb0f33eb6", "universal link");
    return Scaffold(
        appBar: AppBar(title: const Text('首页')),
        body: Column(children: [
          TextButton(
            child: const Text('111'),
            onPressed: () {
              // UMengShare.shareText(UMSharePlatform.Qzone, "test 分享");
              // UMengShare.shareText(UMSharePlatform.WechatSession, "FENX");
              UMengShare.shareImage(
                UMSharePlatform.WechatSession,
                "https://pics3.baidu.com/feed/b3119313b07eca801b8cf7a23199d9d5a0448329.png?token=81d3401ccb1a44a9dc5adf27d2567c75",
                "https://pics3.baidu.com/feed/b3119313b07eca801b8cf7a23199d9d5a0448329.png?token=81d3401ccb1a44a9dc5adf27d2567c75",
              );
            },
          )
        ]));
  }
}
