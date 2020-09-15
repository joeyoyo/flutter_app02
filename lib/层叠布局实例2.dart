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
              alignment: Alignment.center,
              fit: StackFit.expand, //未定位widget占满Stack整个空间
              children: <Widget>[
                Positioned(
                  left: 18.0,
                  child: Text("I am Jack"),
                ),
                Container(
                  child: Text("Hello world",
                      style: TextStyle(color: Colors.white)),
                  color: Colors.red,
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
// 由于第二个子文本组件没有定位，所以fit属性会对它起作用，
// 就会占满Stack。由于Stack子元素是堆叠的，
// 所以第一个子文本组件被第二个遮住了，而第三个在最上层，所以可以正常显示。
