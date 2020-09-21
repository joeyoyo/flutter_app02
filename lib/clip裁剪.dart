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
    Widget avatar = Image.asset("images/hiyori.jpg", width: 60.0);
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('剪裁（Clip）'),
          textTheme:
              TextTheme(title: TextStyle(fontSize: 18, color: Colors.yellow)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: Center(
            child: Column(
              children: <Widget>[
                avatar, //不剪裁
                ClipOval(child: avatar), //剪裁为圆形
                ClipRRect(
                  //剪裁为圆角矩形
                  borderRadius: BorderRadius.circular(5.0),
                  child: avatar,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      widthFactor: .5, //宽度设为原来宽度一半，另一半会溢出
                      child: avatar,
                    ),
                    Text(
                      "你好世界",
                      style: TextStyle(color: Colors.green),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipRect(
                      //将溢出部分剪裁
                      child: Align(
                        alignment: Alignment.topLeft,
                        widthFactor: .5, //宽度设为原来宽度一半
                        child: avatar,
                      ),
                    ),
                    Text("你好世界", style: TextStyle(color: Colors.green))
                  ],
                ),
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  child: ClipRect(
                    clipper: MyClipper(), //使用自定义的clipper
                    child: avatar,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  //getClip()是用于获取剪裁区域的接口，由于图片大小是60×60，我们返回剪裁区域为Rect.fromLTWH(10.0, 15.0, 40.0, 30.0)，即图片中部40×30像素的范围。
  Rect getClip(Size size) => Rect.fromLTWH(10.0, 15.0, 40.0, 30.0);

  @override
  //shouldReclip() 接口决定是否重新剪裁。如果在应用中，剪裁区域始终不会发生变化时应该返回false，这样就不会触发重新剪裁，避免不必要的性能开销。
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}
