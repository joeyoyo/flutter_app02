import 'package:flutter/material.dart';

void main() => runApp(MyApp());

bool isLogin = false;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: FillInOrderRoute(),
      //注册路由表
      routes: {},
      onGenerateRoute: (RouteSettings setting) {
        return MaterialPageRoute(builder: (context) {
          String routeName = setting.name;
          // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，引导用户登录；其它情况则正常打开路由。
          if (routeName == "select_address_page" && !isLogin) {
            return LoginTextFieldApp();
          } else {
            return SelectAddressRoute(text: setting.arguments);
          }
        });
      },
    );
  }
}

class FillInOrderRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("填写订单"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text("选择收货地址"),
                onPressed: () async {
                  var result = await Navigator.pushNamed(
                      context, "select_address_page",
                      arguments: "我是传参过来的");
                  //输出SelectAddressRoute路由返回结果
                  print("路由返回值：$result");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectAddressRoute extends StatelessWidget {
  const SelectAddressRoute({
    Key key,
    @required this.text, //接收一个text参数
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("选择收货地址"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                onPressed: () => Navigator.pop(context, "湖南长沙"),
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginTextFieldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我是登录页"),
      ),
      body: Center(
        child: Text("我是登录页"),
      ),
    );
  }
}
