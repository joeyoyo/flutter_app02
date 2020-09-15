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
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text('输入框练习'),
            textTheme:
                TextTheme(title: TextStyle(fontSize: 18, color: Colors.yellow)),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                TextField(
                  autofocus: true,
                  focusNode: focusNode1, //关联focusNode1
                  decoration: InputDecoration(labelText: "input1"),
                ),
                TextField(
                  focusNode: focusNode2, //关联focusNode2
                  decoration: InputDecoration(
                    labelText: "input2",
                    prefixIcon: Icon(Icons.person),
                    // 未获得焦点下划线设为灰色
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    //获得焦点下划线设为蓝色
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
                Builder(
                  builder: (ctx) {
                    return Column(
                      children: <Widget>[
                        RaisedButton(
                          child: Text("移动焦点"),
                          onPressed: () {
                            //将焦点从第一个TextField移到第二个TextField
                            // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                            // 这是第二种写法
                            if (null == focusScopeNode) {
                              focusScopeNode = FocusScope.of(context);
                            }
                            focusScopeNode.requestFocus(focusNode2);
                          },
                        ),
                        RaisedButton(
                          child: Text("隐藏键盘"),
                          onPressed: () {
                            // 当所有编辑框都失去焦点时键盘就会收起
                            focusNode1.unfocus();
                            focusNode2.unfocus();
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          )),
    );
  }
}
