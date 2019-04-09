import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '测试demo',
      theme: ThemeData(primaryColor: Colors.deepOrange),
      home: new Row(
        children: <Widget>[
          Container(
            color: Colors.red,
            width: 100.0,
          ),
          LimitedBox(
            maxWidth: 100.0,
            maxHeight: 100.0,
            child: Container(
              color: Colors.blue,
              width: 250.0,
            ),
          ),
        ],
      ),
    );
  }
}
