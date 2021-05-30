import 'package:flutter/material.dart';
import 'package:flutter_app_singletons/data/singleton.dart';

import 'other_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _mySingleton = MySingleton();

  void _incrementCounter() {
    _mySingleton.increment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: Icon(Icons.screen_share),
          tooltip: 'Other Screen',
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OtherScreen(),
              )),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            // Container(
            //   width: 300.0,
            //   child: TextField(
            //     controller: _mySingleton.nameController,
            //   ),
            // ),
            // ValueListenableBuilder(
            //   valueListenable: _mySingleton.count,
            //   builder: (context, value, child) => Text(
            //     '$value',
            //     style: Theme.of(context).textTheme.headline4,
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _mySingleton.addName,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
