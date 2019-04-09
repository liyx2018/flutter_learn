import 'package:flutter/material.dart';
import 'package:flutter_learn/routerdemo/mainfourday.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //静态路由方式 配置初始路由
      initialRoute: '/',
      routes: {
        //默认走这个条件`/`
        '/': (context) {
          return HomeStateful();
        },
        //新页面路由
        '/mainnewroute': (context) {
          return new newRoute('ogg');
        }
      },
      //主题色
      theme: ThemeData(
          //设置为红色
          primarySwatch: Colors.red),
      //配置了初始路由，下面就不需要了
      //home: HomeStateful(),
    );
  }
}

class HomeStateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeWidget();
  }
}

class HomeWidget extends State<HomeStateful> {
  @override
  Widget build(BuildContext context) {
    //Pointer
    Widget TestContainer = Listener(
      child: Container(
        width: 300.0,
        height: 300.0,
        color: Colors.red,
        child: RaisedButton(
            child: Text('点击我'),
            onPressed: () async {
              //页面跳转方法
             var data=await Navigator.push(context, new MaterialPageRoute(builder: (newpage){
                return new newRoute("好人");
              }));
//              Navigator.of(context).pushNamed('/mainnewroute');
              //动态路由
//            var data = await Navigator.push(
//                context,
//                MaterialPageRoute(builder: (newPage){
//                  return new newRoute('测试');
//                }),
//              );
            //打印返回的数据
            print('==========================='+data);
            }),

      ),
    );
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter Demo'),
      ),
      body: Center(
        child: TestContainer,
      ),
    );
  }
}
