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
      body: Center(
        child: OutlineButton(
            child: new Text('OutlineButton'),
            onPressed: (){
                 Fluttertoast.showToast(
                     msg: '你好,OutlineButton',
                     toastLength: Toast.LENGTH_SHORT,
                     gravity: ToastGravity.BOTTOM,
                     timeInSecForIos: 1,
                     backgroundColor: Colors.red,
                     textColor: Colors.white,
                     fontSize: 16.0
                 );

            },
        ),
      ),
    );
  }
}