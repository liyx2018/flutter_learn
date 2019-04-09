import 'package:flutter/material.dart';
import 'GestureDetectorDemo.dart';

void main(){
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('演示'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: new MyButton(),
        ),
      ),
    );
  }
}




