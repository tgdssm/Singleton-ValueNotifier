import 'package:flutter/material.dart';
import 'package:flutter_app_singletons/data/singleton.dart';
import 'package:flutter_app_singletons/widgets/dropdown_name.dart';

class OtherScreen extends StatelessWidget {
  final _mySingleton = MySingleton();

  void _incrementCounter() {
    _mySingleton.increment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Other Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Container(
              width: 300.0,
              child: TextField(
                controller: _mySingleton.nameController,
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _mySingleton.names,
              builder: (context, value, child) {
                return DropdownName(
                  name: _mySingleton.name,
                  names: value,
                );
              },
            )
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
