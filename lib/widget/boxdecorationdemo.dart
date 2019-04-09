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




    );
  }
}

