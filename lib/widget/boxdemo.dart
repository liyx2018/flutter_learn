import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main(){

  return runApp(new MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: '测试代码',
      home: new MyHomeWidget(),
    );
  }
}

class MyHomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new StateWidget();
  }
}

class StateWidget extends State<MyHomeWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Row(
          children: <Widget>[
            new RaisedButton(
              onPressed: () {
                print('点击红色按钮事件');
              },
              color: const Color(0xffcc0000),
              child: new Text('红色按钮'),
            ),
            new Flexible(
              flex: 1,
              child: new RaisedButton(
                onPressed: () {
                  print('点击黄色按钮事件');
                },
                color: const Color(0xfff1c232),
                child: new Text('黄色按钮'),
              ),
            ),
            new RaisedButton(
              onPressed: () {
                print('点击粉色按钮事件');
              },
              color: const Color(0xffea9999),
              child: new Text('粉色按钮'),
            ),
          ]
      ),
    );
  }
}

