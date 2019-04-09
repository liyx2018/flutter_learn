import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '测试demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.deepOrange
      ),
      home: Scaffold(
        appBar: new AppBar(
          title: Text("测试"),
          centerTitle: true,
        ),
        body: Container(
             alignment: Alignment.center,
             child: Text(
                "测试字体的文字",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: "iconfont",
                  textBaseline: TextBaseline.alphabetic,

                ),
             ),
        ),
      ),
    );
  }

}


