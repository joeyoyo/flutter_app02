import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyIcons {
  // 微信图标
  static const IconData wechat =
      const IconData(0xe65b, fontFamily: 'myIcon', matchTextDirection: true);
  // 支付宝图标
  static const IconData zhifubao =
      const IconData(0xe64a, fontFamily: 'myIcon', matchTextDirection: true);
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  String icons = "\uE914";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'You have pushed the button this many times:',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  MyIcons.zhifubao,
                  color: Colors.purple,
                ),
                Icon(
                  MyIcons.wechat,
                  color: Colors.green,
                ),
              ],
            ),
            Text(
              icons,
              style: TextStyle(
                  fontFamily: "MaterialIcons",
                  fontSize: 24.0,
                  color: Colors.green),
            ),
            Image.network(
              "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
              width: 600.0,
              height: 50,
              fit: BoxFit.cover,
              repeat: ImageRepeat.repeatY,
            ),
            Image(
                image: AssetImage("images/hiyori.jpg"),
                width: 100.0,
                color: Colors.blue,
                colorBlendMode: BlendMode.difference),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            OutlineButton.icon(
              icon: Icon(Icons.send),
              label: Text("open new route"),
              textColor: Colors.blue,
              onPressed: () {
                //导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NewRoute();
                }));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
