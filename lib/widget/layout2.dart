//根Widget 布局二 开始
//左边图片布局
import 'package:flutter/material.dart';

import 'package:flutter_learn/utils/layoutstyle.dart';


Widget LayoutTwoLeft = Container(
  //这次使用裁剪实现圆角矩形
  child:ClipRRect(
    //设置圆角
    borderRadius: BorderRadius.circular(4.0),
    child: Image.network(
      'https://img3.doubanio.com//view//photo//s_ratio_poster//public//p2545472803.webp',
      width: 100.0,
      height: 150.0,
      fit:BoxFit.fill,
    ),

  ),
);

//右下角圆形
CircleAvatar getCircleAvator(String image_url){
  //圆形头像
  return CircleAvatar(
    backgroundColor: Colors.white,
    backgroundImage: NetworkImage(image_url),
  );
}

//右布局
Widget LayoutTwoRightColumn = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    //电影名称
    Text(
      '流浪地球',
      style: getTextStyle(Colors.black, 20.0, true),
    ),

    //豆瓣评分
    getPaddingfromLTRB(  Text(
      '豆瓣评分：7.9',
      style: getTextStyle(Colors.black54, 16.0, false),
    ),t: 3.0),

    //类型
    getPaddingfromLTRB(  Text(
      '类型：科幻、太空、灾难',
      style:getTextStyle(Colors.black54, 16.0, false),
    ),t: 3.0),

    //导演
    Text(
      '导演：郭帆',
      style: getTextStyle(Colors.black54, 16.0, false),
    ),

    //主演
    Container(
      margin: EdgeInsets.only(top:8.0),
      child:Row(
        children: <Widget>[
          Text('主演：'),
          //以Row从左到右排列头像
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left:2.0),
                child: getCircleAvator('https://img3.doubanio.com//view//celebrity//s_ratio_celebrity//public//p1533348792.03.webp'),
              ),
              Container(
                margin: EdgeInsets.only(left:12.0),
                child: getCircleAvator('https://img3.doubanio.com//view//celebrity//s_ratio_celebrity//public//p1501738155.24.webp'),
              ),
              Container(
                margin: EdgeInsets.only(left:12.0),
                child: getCircleAvator('https://img3.doubanio.com//view//celebrity//s_ratio_celebrity//public//p1540619056.43.webp'),
              ),

            ],
          ),
        ],
      ),
    ),
  ],
);

//布局二 右布局 用Expanded占满剩余空间
Widget LayoutTwoRightExpanded = Expanded(
  child:Container(
    //距离左布局10
    margin:EdgeInsets.only(left:10.0),
    //高度
    height:150.0,
    child: LayoutTwoRightColumn,
  ),
);

//整体
Widget RowWidget = Row(
  //主轴上设置从开始方向对齐
  mainAxisAlignment: MainAxisAlignment.start,
  //交叉轴(水平方向)居中
  crossAxisAlignment: CrossAxisAlignment.center,
  children: <Widget>[
    LayoutTwoLeft,
    LayoutTwoRightExpanded,
  ],
);