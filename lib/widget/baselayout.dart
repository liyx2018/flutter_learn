import 'package:flutter/material.dart';

import 'package:flutter_learn/utils/layoutstyle.dart';
import 'package:flutter_learn/widget/layout1.dart';
import 'package:flutter_learn/widget/layout2.dart';
import 'package:flutter_learn/widget/layout3.dart';


void main() {
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

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter Demo'),
      ),
      body: Card(
        child: Container(
          //alignment: Alignment(0.0, 0.0),
            height: 160.0,
            color: Colors.white,
            padding: EdgeInsets.all(10.0),
            child:  Center(
              // 布局一
//               child: ColumnWidget,
              // 布局二
//              child:RowWidget,
             //布局三
              child: LayoutThreeColumn,
            )
        ),
      ),
    );

  }
}





