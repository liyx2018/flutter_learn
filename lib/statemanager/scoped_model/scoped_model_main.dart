import 'package:flutter/material.dart';
import 'model/count_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'top_screen.dart';


//主要作用是数据共享
//Scoped model使用了观察者模式，将数据模型放在父代，后代通过找到父代的model进行数据渲染，
// 最后数据改变时将数据传回，父代再通知所有用到了该model的子代去更新状态。
//需要将它们放在顶层入口MaterialApp之上，这样就能进行全局的状态管理
void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget{

  //创建顶层状态
  CountModel countModel = CountModel();

  @override
  Widget build(BuildContext context) {

    return ScopedModel<CountModel>(
      model: countModel,
      child: new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TopScreen(),
      ),
    );
  }

}