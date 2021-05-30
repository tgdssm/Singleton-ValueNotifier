import 'package:flutter/material.dart';

class MySingleton {
  // Singleton Utilizando Factory Contructor
  MySingleton._internal();
  static final MySingleton _mySingleton = MySingleton._internal();
  factory MySingleton(){
    return _mySingleton;
  }

  final ValueNotifier<int> count = ValueNotifier(0);
  final ValueNotifier<String> name = ValueNotifier('Thalisson');
  final ValueNotifier<List<String>> names = ValueNotifier(['Thalisson', 'Gabriel']);

  final nameController = TextEditingController();

  void increment() {
    count.value = count.value + 1;
    print(name.value);
  }

  void addName() {
    if(nameController.text.isNotEmpty){
      names.value.add(nameController.text);
    }
    names.notifyListeners();
  }
}
