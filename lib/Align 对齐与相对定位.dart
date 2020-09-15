import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Align 对齐与相对定位'),
          textTheme:
              TextTheme(title: TextStyle(fontSize: 18, color: Colors.yellow)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: ConstrainedBox(
              constraints:
                  BoxConstraints.expand(), //通过ConstrainedBox来确保Stack占满屏幕
              child: Container(
                // height: 120.0,
                // width: 120.0,

                color: Colors.blue[50],
                child: Align(
                  widthFactor: 2,
                  heightFactor: 2,

                  // FractionalOffset 的坐标原点为矩形的左侧顶点，这和布局系统的一致 。实际偏移 = (FractionalOffse.x * childWidth, FractionalOffse.y * childHeight)

                  alignment: FractionalOffset(0.2, 0.6),
                  //  Widget会以矩形的中心点作为坐标原点，即Alignment(0.0, 0.0) 。x、y的值从-1到1分别代表矩形左边到右边的距离和顶部到底边的距离
                  // alignment: Alignment.topRight,
                  // alignment: Alignment(1, 0.0),
                  child: FlutterLogo(
                    size: 60,
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
