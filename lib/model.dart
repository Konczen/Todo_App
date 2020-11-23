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

  String _startOption = 'All';

  String get startOption => _startOption;

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

  void setFilterBy(String startOption) {
    this._startOption = startOption;
    notifyListeners();
  }
}
