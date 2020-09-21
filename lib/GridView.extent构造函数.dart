import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyCheck());
}

class MyCheck extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyCheck> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text('GridView.extent构造函数'),
            textTheme:
                TextTheme(title: TextStyle(fontSize: 18, color: Colors.yellow)),
          ),
          // GridView.extent构造函数内部使用了SliverGridDelegateWithMaxCrossAxisExtent，我们通过它可以快速的创建纵轴子元素为固定最大长度的的GridView
          body: GridView.extent(
            maxCrossAxisExtent: 120.0,
            childAspectRatio: 2.0,
            children: <Widget>[
              Icon(Icons.ac_unit),
              Icon(Icons.airport_shuttle),
              Icon(Icons.all_inclusive),
              Icon(Icons.beach_access),
              Icon(Icons.cake),
              Icon(Icons.free_breakfast),
            ],
          )

          // GridView(
          //   padding: EdgeInsets.zero,
          //   // 该子类实现了一个横轴子元素为固定最大长度的layout算法
          //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //       // maxCrossAxisExtent为子元素在横轴上的最大长度
          //       maxCrossAxisExtent: 120.0,
          //       // childAspectRatio所指的子元素横轴和主轴的长度比为最终的长度比
          //       childAspectRatio: 2.0 //宽高比为2
          //       ),
          //   children: <Widget>[
          //     Icon(Icons.ac_unit),
          //     Icon(Icons.airport_shuttle),
          //     Icon(Icons.all_inclusive),
          //     Icon(Icons.beach_access),
          //     Icon(Icons.cake),
          //     Icon(Icons.free_breakfast),
          //   ],
          // ),

          // GridView.count构造函数内部使用了SliverGridDelegateWithFixedCrossAxisCount，
          // 我们通过它可以快速的创建横轴固定数量子元素的GridView
          //     GridView.count(
          //   crossAxisCount: 3,
          //   childAspectRatio: 1.0,
          //   children: <Widget>[
          //     Icon(Icons.ac_unit),
          //     Icon(Icons.airport_shuttle),
          //     Icon(Icons.all_inclusive),
          //     Icon(Icons.beach_access),
          //     Icon(Icons.cake),
          //     Icon(Icons.free_breakfast),
          //   ],
          // ),
          // GridView(
          //     //该子类实现了一个横轴为固定数量子元素的layout算法
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //         crossAxisCount: 3, //横轴三个子widget
          //         childAspectRatio: 1.0 //宽高比为1时，子widget
          //         ),
          //     children: <Widget>[
          //       Icon(Icons.ac_unit),
          //       Icon(Icons.airport_shuttle),
          //       Icon(Icons.all_inclusive),
          //       Icon(Icons.beach_access),
          //       Icon(Icons.cake),
          //       Icon(Icons.free_breakfast)
          //     ]),
          ),
    );
  }
}
