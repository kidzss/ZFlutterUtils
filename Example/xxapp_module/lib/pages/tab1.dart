import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

class Tab1Page extends StatefulWidget {
  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tab1"),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            FlutterBoost.singleton
                .open("flbdemo://flutter/next", exts: {"animated": true}).then((val) {
              print(val);
            });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
