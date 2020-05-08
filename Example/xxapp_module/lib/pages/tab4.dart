import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

class Tab4Page extends StatefulWidget {
  Tab4Page({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _Tab4PageState createState() => _Tab4PageState();
}

class _Tab4PageState extends State<Tab4Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tab4"),
      ),
      body: ListView(
        children: List.generate(20, (int index) {
          return ListTile(
            title: Text("$index"),
            onTap: () {
              FlutterBoost.singleton.open("flbdemo://flutter/next",
                  urlParams: {"key1": "val1", "key2": "val3"},
                  exts: {"animated": true}).then((val) {
                print(val);
              });
            },
          );
        }),
      ),
    );
  }
}
