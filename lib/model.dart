import 'package:flutter/material.dart';
import 'Api.dart';

class OneTask {
  String id;
  String message;
  bool value;

  OneTask({this.id, this.message, this.value = false});

  static Map<String, dynamic> toJson(OneTask task) {
    return {
      'title': task.message,
      'done': task.value,
    };
  }

  static OneTask fromJson(Map<String, dynamic> json) {
    return OneTask(
      id: json['id'],
      message: json['title'],
      value: json['done'],
    );
  }
}

class MyState extends ChangeNotifier {
  List<OneTask> _list = [];

  List<OneTask> get list => _list;

  Future getList() async {
    List<OneTask> list = await Api.getTasks();
    _list = list;
    notifyListeners();
  }

  String _startOption = 'All';

  String get startOption => _startOption;

  void addTask(OneTask task) async {
    _list.add(task);
    await Api.addTask(task);
    await getList();
  }

  void removeTask(OneTask task) async {
    await Api.removeTask(task.id);
    await getList();
  }

  void checkbox(OneTask task, bool value) async {
    task.value = value;
    await Api.updateTask(task, task.id);
    await getList();
  }

  void chooseFilterBy(String startOption) {
    this._startOption = startOption;
    notifyListeners();
  }
}
