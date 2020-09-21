import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          title: Text('GridView.count构造函数'),
          textTheme:
              TextTheme(title: TextStyle(fontSize: 18, color: Colors.yellow)),
        ),
        // GridView.count构造函数内部使用了SliverGridDelegateWithFixedCrossAxisCount，
        // 我们通过它可以快速的创建横轴固定数量子元素的GridView
        body: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          children: <Widget>[
            Icon(Icons.ac_unit),
            Icon(Icons.airport_shuttle),
            Icon(Icons.all_inclusive),
            Icon(Icons.beach_access),
            Icon(Icons.cake),
            Icon(Icons.free_breakfast),
          ],
        ),
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
