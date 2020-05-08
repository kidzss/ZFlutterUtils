import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

import 'pages/tab1.dart';
import 'pages/tab3.dart';
import 'pages/tab4.dart';
import 'pages/next.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    //其中pageName为原生代码传递过来的路由名称（
    //first，second，flutterFragment）都是路由名称 params为原生传递过来的参数
    FlutterBoost.singleton.registerPageBuilders({
      'flbdemo://flutter/tab1': (pageName, params, _) => Tab1Page(),
      'flbdemo://flutter/tab3': (pageName, params, _) => Tab3Page(params),
      'flbdemo://flutter/tab4': (pageName, params, _) => Tab4Page(),
      'flbdemo://flutter/next': (pageName, params, _) => NextPage(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Boost example',
        builder: FlutterBoost.init(postPush: _onRoutePushed),
        home: Container());
  }

  void _onRoutePushed(
      String pageName, String uniqueId, Map params, Route route, Future _) {
  }
}