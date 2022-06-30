import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

late WebViewController controllerGlobal;

class WebViewEx extends StatefulWidget {
  const WebViewEx({Key? key}) : super(key: key);

  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewEx> {
  late bool check, check1;
  late ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
    check = false;
    check1 = false;
  }

  _scrollListener() {
    if (_scrollController.offset <=
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      controllerGlobal.reload();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        controllerGlobal.goBack();
        return Future.value(true);
      },
      child: ListView(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height,
            child: WebView(
              initialUrl: 'https://www.baidu.com',
              gestureNavigationEnabled: true,
              debuggingEnabled: true,
              gestureRecognizers: [
                Factory(() => PlatformViewVerticalGestureRecognizer()),
              ].toSet(),
              javascriptMode: JavascriptMode.unrestricted,
              onPageFinished: (String url) {
                setState(() {
                  bool temp = check;
                  check = true;
                  if (!temp) controllerGlobal.scrollBy(0, 10);
                });
              },
              onWebViewCreated: (WebViewController webViewController) {
                controllerGlobal = webViewController;
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class PlatformViewVerticalGestureRecognizer
    extends VerticalDragGestureRecognizer {
  PlatformViewVerticalGestureRecognizer({PointerDeviceKind? kind})
      : super(kind: kind);

  Offset _dragDistance = Offset.zero;

  @override
  void addPointer(PointerEvent event) {
    startTrackingPointer(event.pointer);
  }

  @override
  void handleEvent(PointerEvent event) {
    _dragDistance = _dragDistance + event.delta;
    controllerGlobal.getScrollY().then((value) {
      print(value);
      if (value < 5) {
        // Fluttertoast.showToast(
        //     msg: "RELOADING",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.BOTTOM,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.amber[800],
        //     textColor: Colors.black,
        //     fontSize: 16.0);
        print('111');
        controllerGlobal.reload();
      }
    });
    // if (event is PointerMoveEvent) {
    //   final double dy = _dragDistance.dy.abs();
    //   final double dx = _dragDistance.dx.abs();

    //   if (dy > dx && dy > kTouchSlop) {
    //     // vertical drag - accept
    //     resolve(GestureDisposition.accepted);
    //     _dragDistance = Offset.zero;
    //   } else if (dx > kTouchSlop && dx > dy) {
    //     // horizontal drag - stop tracking
    //     stopTrackingPointer(event.pointer);
    //     _dragDistance = Offset.zero;
    //   }
    // }
  }

  @override
  String get debugDescription => 'horizontal drag (platform view)';

  @override
  void didStopTrackingLastPointer(int pointer) {}
}
