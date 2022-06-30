import 'package:example/pages/future_builder/c_future_builder.dart';
import 'package:example/pages/inherited/share_data_widget.dart';
import 'package:example/pages/key_test/test_key.dart';
import 'package:example/pages/test_animate.dart';
import 'package:example/pages/test_constraint.dart';
import 'package:example/pages/test_lifecycle/test_lifecycle.dart';
import 'package:example/pages/test_list.dart';
import 'package:example/pages/test_list_state.dart';
import 'package:example/pages/test_list_state_2.dart';
import 'package:example/pages/test_refresh.dart';
import 'package:example/pages/test_refresh_2.dart';
import 'package:example/pages/test_sliver.dart';
import 'package:example/pages/test_webview.dart';
import 'package:example/themes/gallery_theme_data.dart';
import 'package:example/widgets/c_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vast_flutter_ui/vast_flutter_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        // theme: ThemeData(
        //   // This is the theme of your application.
        //   //
        //   // Try running your application with "flutter run". You'll see the
        //   // application has a blue toolbar. Then, without quitting the app, try
        //   // changing the primarySwatch below to Colors.green and then invoke
        //   // "hot reload" (press "r" in the console where you ran "flutter run",
        //   // or simply save your changes to "hot reload" in a Flutter IDE).
        //   // Notice that the counter didn't reset back to zero; the application
        //   // is not restarted.
        //   primarySwatch: Colors.red,
        // ),
        themeMode: ThemeMode.system,
        // theme: GalleryThemeData.lightThemeData.copyWith(
        //     // platform: GalleryOptions.of(context).platform,

        //     ),
        // darkTheme: GalleryThemeData.darkThemeData.copyWith(
        //     // platform: GalleryOptions.of(context).platform,
        //     ),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        // home: TestKeyPage(),
        // home: TestLifeCyclePage());
        home: CFutureBuilder());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Calculator calculator = Calculator();

  final items = [1, 2, 3, 4, 5];

  void _incrementCounter() {
    setState(() {
      _counter++;
      print(calculator.addOne(1).toString());
      items[0] = 7;
    });
  }

  void _changeTheme() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      print('init state');
    }
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (kDebugMode) {
      print('didChangeDependencies');
    }
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('deactivate');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      // body: const SliverPage(),
      // body:const ListPage(),
      // body: const TestAnimatePage(),
      // body: const RefreshPage(),
      // body: const Refresh2Page(),
      // body: const WebViewEx(),
      // body: ConstrainedBox(
      //   constraints: const BoxConstraints(
      //     minWidth: 70,
      //     minHeight: 70,
      //     maxWidth: 150,
      //     maxHeight: 150,
      //   ),
      //   child: Container(color: Colors.black, width: 10, height: 10),
      // ),
      // body: Center(
      //     child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: <Widget>[
      //       const Text(
      //         'You have pushed the button this many times:',
      //       ),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headline4,
      //       ),
      //       const CText(),
      //       ShareDataWidget(
      //         //使用ShareDataWidget
      //         data: _counter,
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: <Widget>[
      //             Padding(
      //               padding: const EdgeInsets.only(bottom: 20.0),
      //               child: TestWidget(), //子widget中依赖ShareDataWidget
      //             ),
      //             ElevatedButton(
      //               child: Text("Increment"),
      //               //每点击一次，将count自增，然后重新build,ShareDataWidget的data将被更新
      //               onPressed: () => setState(() => ++_counter),
      //             )
      //           ],
      //         ),
      //       )
      //     ])),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            // return Text(items[index].toString());
            return ListStatePage(
              title: items[index].toString(),
            );
            // return ListTile(
            //   title: Text(items[index].toString()),
            // );
          }),
      // body: TestListPartPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
