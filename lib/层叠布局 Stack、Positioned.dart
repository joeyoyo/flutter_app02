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
          title: Text('层叠布局 Stack、Positioned'),
          textTheme:
              TextTheme(title: TextStyle(fontSize: 18, color: Colors.yellow)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: ConstrainedBox(
            constraints: BoxConstraints.expand(), //通过ConstrainedBox来确保Stack占满屏幕
            child: Stack(
              alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
              children: <Widget>[
                Container(
                  child: Text("Hello world",
                      style: TextStyle(color: Colors.white)),
                  color: Colors.red,
                ),
                Positioned(
                  left: 18.0,
                  child: Text("I am Jack"),
                ),
                Positioned(
                  top: 18.0,
                  child: Text("Your friend"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
