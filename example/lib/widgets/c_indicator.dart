import 'package:flutter/cupertino.dart';

class CIndicator extends StatefulWidget {
  final Widget child;
  const CIndicator({Key? key, required this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CIndicatorState();
  }
}

class CIndicatorState extends State<CIndicator> {
  _RefreshIndicatorMode? _mode;

  @override
  Widget build(BuildContext context) {
    final Widget child = NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: _handleGlowNotification,
        child: widget.child,
      ),
    );

    return Stack(children: <Widget>[child, if (_mode != null) Text('hello')]);
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    // if (!widget.notificationPredicate(notification)) return false;
    // if (_shouldStart(notification)) {
    //   setState(() {
    //     _mode = _RefreshIndicatorMode.drag;
    //   });
    //   return false;
    // }
    // bool? indicatorAtTopNow;
    // switch (notification.metrics.axisDirection) {
    //   case AxisDirection.down:
    //     indicatorAtTopNow = true;
    //     break;
    //   case AxisDirection.up:
    //     indicatorAtTopNow = false;
    //     break;
    //   case AxisDirection.left:
    //   case AxisDirection.right:
    //     indicatorAtTopNow = null;
    //     break;
    // }
    // if (indicatorAtTopNow != _isIndicatorAtTop) {
    //   if (_mode == _RefreshIndicatorMode.drag ||
    //       _mode == _RefreshIndicatorMode.armed)
    //     _dismiss(_RefreshIndicatorMode.canceled);
    // } else if (notification is ScrollUpdateNotification) {
    //   if (_mode == _RefreshIndicatorMode.drag ||
    //       _mode == _RefreshIndicatorMode.armed) {
    //     if (notification.metrics.extentBefore > 0.0) {
    //       _dismiss(_RefreshIndicatorMode.canceled);
    //     } else {
    //       _dragOffset = _dragOffset! - notification.scrollDelta!;
    //       _checkDragOffset(notification.metrics.viewportDimension);
    //     }
    //   }
    //   if (_mode == _RefreshIndicatorMode.armed &&
    //       notification.dragDetails == null) {
    //     // On iOS start the refresh when the Scrollable bounces back from the
    //     // overscroll (ScrollNotification indicating this don't have dragDetails
    //     // because the scroll activity is not directly triggered by a drag).
    //     _show();
    //   }
    // } else if (notification is OverscrollNotification) {
    //   if (_mode == _RefreshIndicatorMode.drag ||
    //       _mode == _RefreshIndicatorMode.armed) {
    //     _dragOffset = _dragOffset! - notification.overscroll;
    //     _checkDragOffset(notification.metrics.viewportDimension);
    //   }
    // } else if (notification is ScrollEndNotification) {
    //   switch (_mode) {
    //     case _RefreshIndicatorMode.armed:
    //       _show();
    //       break;
    //     case _RefreshIndicatorMode.drag:
    //       _dismiss(_RefreshIndicatorMode.canceled);
    //       break;
    //     case _RefreshIndicatorMode.canceled:
    //     case _RefreshIndicatorMode.done:
    //     case _RefreshIndicatorMode.refresh:
    //     case _RefreshIndicatorMode.snap:
    //     case null:
    //       // do nothing
    //       break;
    //   }
    // }
    print('_handleScrollNotification');
    return false;
  }

  bool _handleGlowNotification(OverscrollIndicatorNotification notification) {
    // if (notification.depth != 0 || !notification.leading) return false;
    // if (_mode == _RefreshIndicatorMode.drag) {
    //   notification.disallowGlow();
    //   return true;
    // }
    print('_handleGlowNotification');
    return false;
  }
}

enum _RefreshIndicatorMode {
  drag, // Pointer is down.
  armed, // Dragged far enough that an up event will run the onRefresh callback.
  snap, // Animating to the indicator's final "displacement".
  refresh, // Running the refresh callback.
  done, // Animating the indicator's fade-out after refreshing.
  canceled, // Animating the indicator's fade-out after not arming.
}
