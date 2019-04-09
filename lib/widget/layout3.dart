//布局三开始第一行
import 'package:flutter/material.dart';

import 'package:flutter_learn/utils/layoutstyle.dart';

Widget LayoutThreeOne = Row(
  children: <Widget>[
    Expanded(
        child: Row(
          children: <Widget>[
            Text('作者：'),
            Text('HuYounger',
              style: getTextStyle(Colors.redAccent[400], 14, false),
            ),
          ],
        )
    ),
    //收藏图标
    getPaddingfromLTRB(Icon(Icons.favorite,color:Colors.red),r:10.0),
    //分享图标
    Icon(Icons.share,color:Colors.black),
  ],
);


//布局三开始第三行
Widget LayoutThreeThree = Row(
  children: <Widget>[
    Expanded(
      child: Row(
        children: <Widget>[
          Text('分类:'),
          getPaddingfromLTRB(Text('开发环境/Android',
              style:getTextStyle(Colors.deepPurpleAccent, 14, false)),l:8.0),
        ],
      ),
    ),
    Text('发布时间：2018-12-13'),
  ],
);


//布局三整合
Widget LayoutThreeColumn = Column(
  //主轴上设置居中
  mainAxisAlignment: MainAxisAlignment.center,
  //交叉轴(水平方向)设置从左开始
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    //第一行
    LayoutThreeOne,
    //第二行
    getPaddingfromLTRB(Text('Android Monitor使用介绍',
      style:getTextStyle(Colors.black, 18, false),
    ),t:10.0),
    //第三行
    getPaddingfromLTRB(LayoutThreeThree,t:10.0),
  ],

);
