import 'package:flutter/cupertino.dart';

class CText extends StatefulWidget {
  const CText({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CTextState();
  }
}

class CTextState extends State {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('ctext init state');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('ctext didChangeDependencies');
  }

  @override
  void didUpdateWidget(covariant StatefulWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('ctext didUpdateWidget');
  }

  @override
  Widget build(BuildContext context) {
    print('ctext build');
    return const Text('hello');
  }
}
