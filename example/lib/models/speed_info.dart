class Speed {
  final int type;

  Speed({required this.type});
}

class Header extends Speed {
  final String title;
  Header({required int type, required this.title}) : super(type: type);
}

class Content extends Speed {
  final String content;
  Content({required int type, required this.content}) : super(type: type);
}

class Footer extends Speed {
  final String title;
  Footer({required int type, required this.title}) : super(type: type);
}
