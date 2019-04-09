import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('AlertDialog使用'),
        ),
        body: new MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildCenterButton(context);
  }

  Widget _buildCenterButton(BuildContext context) {
    return new Container(
        alignment: Alignment.center,
        child: new Container(
          child: _buildButton(context),
        ));
  }

  Widget _buildButton(BuildContext context) {
    return new RaisedButton(
        padding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        //padding
        child: new Text(
          'show dialog',
          style: new TextStyle(
            fontSize: 18.0, //textsize
            color: Colors.white, // textcolor
          ),
        ),
        color: Theme
            .of(context)
            .accentColor,
        elevation: 4.0,
        //shadow
        splashColor: Colors.blueGrey,
        onPressed: () {
          showAlertDialog(context);
        });
  }

  void showAlertDialog(BuildContext context) {
    NavigatorState navigator = context.rootAncestorStateOfType(const TypeMatcher<NavigatorState>());
    showDialog(context: context, barrierDismissible: false,
      builder: (BuildContext context) {
        return CustomDialog(
            onCancelChooseEvent: () {
              navigator.pop(context);
              Fluttertoast.showToast(msg: '暂不更新');
            },
            onConfirmChooseEvent: () {
              navigator.pop(context);
              Fluttertoast.showToast(msg: '现在更新');
            }
        );
      },
    );
  }
}

class CustomDialog extends Dialog {

  Function onCancelChooseEvent;
  Function onConfirmChooseEvent;

  CustomDialog({
    Key key,
    @required this.onCancelChooseEvent,
    @required this.onConfirmChooseEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Padding(
        padding: const EdgeInsets.all(12.0),
        child: new Material(
            type: MaterialType.transparency,
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                      decoration: ShapeDecoration(
                          color: Color(0xFFFFFFFF),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12.0),
                              ))),
                      margin: const EdgeInsets.all(12.0),
                      child: new Column(children: <Widget>[
                        new Container(
                          constraints: new BoxConstraints.expand(
                            height: Theme
                                .of(context)
                                .textTheme
                                .display1
                                .fontSize * 1.1 + 100.0,
                          ),
                          decoration: new BoxDecoration(
                            image: new DecorationImage(
                              image: AssetImage("images/mask.png"),
                              centerSlice: new Rect.fromLTRB(
                                  100.0, 180.0, 1360.0, 730.0),
                            ),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                child: Text(
                                  '检测到新版本: V1.2',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                padding: EdgeInsets.all(10.0),
                              ),
                              Padding(
                                child: Text(
                                  '安装包大小:38.5M',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                padding: EdgeInsets.all(10.0),
                              ),

                            ],
                          ),
                        ),
                        new SingleChildScrollView(
                          padding: EdgeInsets.all(10.0),
                          child: ListBody(
                            children: <Widget>[
                              Text('1.修复已知bug;\n2."我的"全新改版;\n3.新增升级更新功能。'),
                            ],
                          ),

                        ),
                        _buildDeviderLine(),
                        new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              _chooseButton(1),
                              _buildVerticalLine(),
                              _chooseButton(2),
                            ])
                      ]))
                ])));
  }

  Widget _chooseButton(var status) {
    return GestureDetector(
        child: MaterialButton(
            minWidth: 155.7,
            height: 50.0,
            elevation: 0.0,
            highlightElevation: 0.0,
            onPressed: status == 1 ? this.onCancelChooseEvent : this.onConfirmChooseEvent,
            color: Color(0xFFFFFFFF),
            child: Text(status == 1 ? '暂不更新' : '立即更新',
                     style: TextStyle(
                            color: Color(status == 1 ? 0xFF000000 : 0xff4285f4),
                            fontSize: 18.0)
                     )
        ),
    );
  }

  Container _buildDeviderLine() {
    return Container(
      width: 560.0,
      height: 0.5,
      color: Colors.grey[400],
    );
  }

  Container _buildVerticalLine() {
    return Container(
      width: 0.5,
      height: 50.0,
      color: Colors.grey[400],
    );
  }
}
