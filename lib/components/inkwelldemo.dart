import 'package:flutter/material.dart';

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
            title: new Text('水波纹效果'),
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

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap:(){
        Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("测试水波纹效果")));
      },
      child: Container(
        width: 100.0,
        height: 80.0,
        alignment: Alignment.center,
        padding: EdgeInsets.all(5.0),
        child: Text(
          '按钮显示',
          style: TextStyle(
               fontSize: 18.0,
               color: Colors.red,
          ),
        )
      ),

    );
  }
}




