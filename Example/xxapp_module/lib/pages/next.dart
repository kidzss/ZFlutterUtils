import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

class NextPage extends StatefulWidget {
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            FlutterBoost.singleton.closeCurrent(result: {"key": "val"});
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text("NextPage"),
      ),
      body: ListView(
        children: List.generate(20, (int index) {
          return ListTile(
            title: Text("$index"),
            onTap: () {
              FlutterBoost.singleton
                  .open("flbdemo://flutter/next", exts: {"animated": true}).then((val) {
                print(val);
              });
            },
          );
        }),
      ),
    );
  }
}
