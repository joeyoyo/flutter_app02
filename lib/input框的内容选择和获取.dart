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
  bool _flag = false;
  bool checkFlag = false;
  //定义一个controller
  TextEditingController _selectionController = TextEditingController();
  TextEditingController _unameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text('单选框和复选框练习'),
            textTheme:
                TextTheme(title: TextStyle(fontSize: 18, color: Colors.yellow)),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                Switch(
                  value: this._flag,
                  activeColor: Colors.red,
                  activeTrackColor: Colors.orange,
                  inactiveTrackColor: Colors.green,
                  inactiveThumbColor: Colors.blue,
                  // activeThumbImage: AssetImage('images/weixin_invite.png'),
                  inactiveThumbImage: NetworkImage(
                    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591175847643&di=6e41a32b6e6355aacbfae14d03439a83&imgtype=0&src=http%3A%2F%2Fimgwx4.2345.com%2Fdypcimg%2Fdongman%2Fimg%2F2%2F25%2Fsup75205_223x310.jpg',
                  ),
                  onChanged: (value) {
                    setState(() {
                      this._flag = value;
                    });
                    //改变输入框的文本
                    _selectionController.text = value.toString();
                    _selectionController.selection = TextSelection(
                        baseOffset: 2,
                        extentOffset: _selectionController.text.length);
                  },
                ),
                Checkbox(
                  value: checkFlag,
                  activeColor: Colors.red, //选中时的颜色
                  checkColor: Colors.white,
                  hoverColor: Colors.blue,
                  focusColor: Colors.yellow,
                  autofocus: true,
                  onChanged: (value) {
                    setState(() {
                      checkFlag = value;
                    });
                    //打印出输入框的内容
                    // print(_unameController.text);
                  },
                ),
                Text(
                  '此时的switch状态是${this._flag == true ? "选中" : "未选中"}',
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
                Text(
                  '此时checkbox状态是${this.checkFlag == true ? "选中" : "未选中"}',
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                ),
                TextField(
                  autofocus: true,
                  controller: _selectionController,
                  // controller: _unameController, //设置controller
                  onChanged: (v) {
                    print("onChange: $v");
                  },
                  decoration: InputDecoration(
                      labelText: "用户名",
                      hintText: "用户名或邮箱",
                      prefixIcon: Icon(Icons.person)),
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "您的登录密码",
                      prefixIcon: Icon(Icons.lock)),
                  obscureText: true,
                ),
              ],
            ),
          )),
    );
  }
}
