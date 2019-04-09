import 'package:flutter/material.dart';
class newRoute extends StatelessWidget{

  String str;
  newRoute(this.str);

  @override
  Widget build(BuildContext context){
    return HomeWidget(str);
    //注意：不需要MaterialApp
//    return MaterialApp(
//      theme: ThemeData(
//        //设置为hongse
//          primarySwatch: Colors.red),
//      home: HomeWidget(),
//      );

  }
}

class HomeWidget extends StatelessWidget{

  String newDate;

  HomeWidget(this.newDate);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('new Route'),
      ),
      body: Center(
        child:RaisedButton(
            child: Text(newDate),
            onPressed: (){
              //这是关闭页面
              Navigator.pop(context,'返回的数据啊');
            }),
        // child: Text('这是新的页面'),
      ),
    );
  }
}
