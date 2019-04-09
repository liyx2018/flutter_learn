import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


void main(){

  return runApp(new MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

  List list = new List(); //列表要展示的数据


  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        list = List.generate(15, (i) => '哈喽,我是原始数据 $i');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: new Text('ListView演示'),
        ),
        //用card裹住
        body: Container(
            //颜色
            color: Colors.white,
            padding: EdgeInsets.all(10.0),
            child: Center(
                child: RefreshIndicator(
                  child:  ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: _renderRow(context, index),
                        margin: EdgeInsets.all(5.0),
                      );
                    },
                  ),
                  onRefresh: _onRefresh,
                ),

            ),
        ),

    );
  }

  Widget _renderRow(BuildContext context, int index) {
    return ListTile(
      title: Text(list[index]),
    );
  }

  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 3), () {
      print('refresh');
      setState(() {
        list = List.generate(20, (i) => '哈喽,我是新刷新的 $i');
      });
    });
  }
}
