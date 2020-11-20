import 'package:flutter/material.dart';

class OneTask {
  String message;
  bool value;

  OneTask({this.message, this.value = false});

  void check() {
    if (this.value == false) {
      this.value = true;
    } else {
      this.value = false;
    }
  }
}

class MyState extends ChangeNotifier {
  List<OneTask> _list = [];

  List<OneTask> get list => _list;

  void addTask(OneTask task) {
    _list.add(task);
    notifyListeners();
  }

  void removeItem(OneTask task) {
    _list.remove(task);
    notifyListeners();
  }

  void checkbox(OneTask task) {
    var index = list.indexOf(task);
    _list[index].check();
    notifyListeners();
  }

  List<OneTask> filterList(String options) {
    if (options == "Done") {
      return _list.where((task) => task.value == true).toList();
    } else if (options == "Undone") {
      return _list.where((task) => task.value == false).toList();
    }
    return _list;
  }
}
