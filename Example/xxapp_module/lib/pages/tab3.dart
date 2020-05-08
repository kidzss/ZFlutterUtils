import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter/services.dart';

const EventChannel eventChannel =
    const EventChannel("xyz.flutter.io/nativeCallFlutter");
const MethodChannel platform =
    const MethodChannel("xyz.flutter.io/flutterCallNative");
class Tab3Page extends StatefulWidget {
  final Map params;
  Tab3Page(this.params);

  @override
  _Tab3PageState createState() => _Tab3PageState(params);
}

class _Tab3PageState extends State<Tab3Page> {
  final Map params;
  _Tab3PageState(this.params);

  String value = '';

  void _onEvent(Object event) {
    if (event is Map) {
      setState(() {
        value = event["params"].toString();
      });
    }

    print("----------$event----------");
  }

  void _onError(Object error) {
    setState(() {
      print("----------$error----------");
    });
  }

  void initState() {
    super.initState();
    eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("自定义Channel"),
        ),
        body: Column(
          children: <Widget>[
            Text("参数是：$params"),
            RaisedButton(
              onPressed: () {
                // 关闭dart页面
                FlutterBoost.singleton.closeByContext(context);
              },
              child: Text('关闭当前页面'),
            ),
            RaisedButton(
              onPressed: () {
                FlutterBoost.singleton.closeByContext(context);
                //dart跳转原生页面以及传递参数
                FlutterBoost.singleton.open("flbdemo://flutter/next",
                    urlParams: {"key": "打开next页面"},
                    exts: {"animated": true, "title": "标题"}).then((val) {
                  print(val);
                });
              },
              child: Text('跳转next传递参数'),
            ),
            RaisedButton(
                child: Text('Flutter call Native'),
                onPressed: _secondflutterCallNative),
            Text(value.length > 0 ? "收到Native的消息：$value" : '')
          ],
        ));
  }

  Future<Null> _secondflutterCallNative() async {
    try {
      var result = await platform.invokeMethod("flutterCallNative");
      setState(() {
        value = result.toString();
      });
    } catch (e) {
      print("Failed flutterCallNative: '${e.message}'.");
    }
  }
}
