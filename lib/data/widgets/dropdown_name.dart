import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DropdownName extends StatelessWidget {
  ValueNotifier<String> name;
  final List<String> names;
  DropdownName({this.name, this.names});
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  ValueListenableBuilder(
        valueListenable: name,
        builder: (context, value, child) => DropdownButton<String>(
          value: value,
          onChanged: (value) {
            name.value = value;
          },
          items: names
              .map<DropdownMenuItem<String>>(
                (e) => DropdownMenuItem(
              child: Text(e),
              value: e,
            ),
          )
              .toList(),
        ),
      )
    );
  }
}
