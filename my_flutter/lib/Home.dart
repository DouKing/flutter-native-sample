import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 注册一个通知，监听 native 事件
  static const EventChannel eventChannel = const EventChannel('samples.flutter.io/event');

  String naviTitle = 'title';

  //相当于 viewDidLoad
  @override
  void initState() {
    super.initState();
    setState(() {
      naviTitle = 'initial title';
    });
    eventChannel.receiveBroadcastStream('Hello').listen(_onEvent, onError: _onError);
  }

  // 回调事件
  void _onEvent(Object event) {
    setState(() {
      naviTitle = event.toString();
    });
  }

  // 错误返回
  void _onError(Object error) {
    setState(() {
      naviTitle = 'error: ${error.toString()}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // Here we take the value from the HomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(naviTitle),
          ],
        ),
      ),
    );
  }
}