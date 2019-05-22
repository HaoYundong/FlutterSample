import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'controller/ContainerPage.dart';
import 'controller/HttpPage.dart';
import 'controller/ImagePage.dart';
import 'controller/StateWidgetPage.dart';
import 'controller/ThemePage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sample App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SampleAppPage(),
      routes: <String, WidgetBuilder> {
        'ThemePage': (BuildContext context) => new ThemePage(),
        'StateWidgetPage': (BuildContext context) => new StateWidgetPage(),
        'HttpPage': (BuildContext context) => new HttpPage(),
        'ContainerPage': (BuildContext context) => new ContainerPage(),
        'ImagePage': (BuildContext context) => new ImagePage(),
      },
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => new _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sample App"),
      ),
      body: new ListView(
          children: _getListData()
      ),
    );
  }

  _getListData() {
    List<Widget> widgets = [];

    widgets.add(_getListItem("ThemePage", () {
      Navigator.of(context).pushNamed('ThemePage');
    }));

    widgets.add(_getListItem("StateWidgetPage", () {
      Navigator.of(context).pushNamed('StateWidgetPage');
    }));

    widgets.add(_getListItem("打开百度", () {
      const url = 'https://www.baidu.com';
      launch(url);
    }));

    widgets.add(_getListItem("Http请求", () {
      Navigator.of(context).pushNamed('HttpPage');
    }));

    widgets.add(_getListItem("容器", () {
      Navigator.of(context).pushNamed('ContainerPage');
    }));

    widgets.add(_getListItem("图片", () {
      Navigator.of(context).pushNamed('ImagePage');
    }));


    return widgets;
  }

  _getListItem(String title, GestureTapCallback tapGesture) {
    return new GestureDetector(
      child: new Padding(
          padding: new EdgeInsets.all(20.0),
          child: new Text(title)
      ),
      onTap: tapGesture,
    );
  }
}
