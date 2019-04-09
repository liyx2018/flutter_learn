import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/layoutstyle.dart';


var l1 = LinearGradient(
  colors: const [
    Colors.blue,
    Colors.blue,
  ],
);

var l2 = RadialGradient(
  colors: const [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.amber,
    Colors.grey,
  ],
  stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
);

//抽取第二行渐变text效果
Container getText(String text, LinearGradient linearGradient) {
  return Container(
    //距离左边距离10dp
    margin: const EdgeInsets.only(left: 10),
    //约束 相当于直接制定了该Container的宽和高，且它的优先级要高于width和height
    constraints: new BoxConstraints.expand(
      width: 70.0,
      height: 30.0,
    ),
    //文字居中
    alignment: Alignment.center,
    child: new Text(
      text,
      style: getTextStyle(Colors.white, 14, false),
    ),
    decoration: new BoxDecoration(
      color: Colors.blue,
      //圆角
      borderRadius: new BorderRadius.all(new Radius.circular(6.0)),
      //添加渐变
      gradient: linearGradient,
    ),
  );
}

//第二行
Widget rowWidget = Row(
  //主轴左边对齐
  mainAxisAlignment: MainAxisAlignment.start,
  //交叉轴(竖直方向)居中
  crossAxisAlignment: CrossAxisAlignment.center,
  children: <Widget>[
    Text(
      "分类:",
      style: getTextStyle(Colors.blue, 14, true),
    ),
    getText("多线程", l1),
    getText("Java深入", l1),
  ],
);

//第三行
Widget rowthreeWidget = Row(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: <Widget>[
    new Expanded(
      child: Text(
        "作者:EnjoyMoving",
        style: getTextStyle(Colors.grey[400], 14, true),
      ),
    ),
    getPaddingfromLTRB(
        Text(
          '时间:2019-02-02',
          style: getTextStyle(Colors.black, 14, true),
        ),
        r: 10.0),
    getPaddingfromLTRB(
        Icon(
          Icons.favorite_border,
          color: Colors.grey[400],
        ),
        r: 0.0)
  ],
);

Widget ColumnWidget = Column(

  //主轴上设置居中
  mainAxisAlignment: MainAxisAlignment.center,
  //交叉轴(水平方向)设置从左开始
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    //第一行
    getPaddingfromLTRB(
        Text(
          'Java synchronized原理总结',
          style: getTextStyle(Colors.black, 16, true),
        ),
        t: 0.0),
    //第二行
    getPaddingfromLTRB(rowWidget, t: 10.0),
    //第三行
    getPaddingfromLTRB(rowthreeWidget, t: 10.0),
  ],
);
