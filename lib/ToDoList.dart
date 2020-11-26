import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class ToDoList extends StatelessWidget {
  final List<OneTask> list;
  ToDoList(this.list);

  Widget build(BuildContext context) {
    return ListView(
      children: list.map((task) => _item(context, task)).toList(),
    );
  }
}

Widget _item(context, OneTask task) {
  return Card(
    child: CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(
        task.message,
        style: TextStyle(
          fontSize: 20,
          decoration:
              (task.value ? TextDecoration.lineThrough : TextDecoration.none),
        ),
      ),
      value: task.value,
      onChanged: (bool newVal) {
        var state = Provider.of<MyState>(context, listen: false);
        state.checkbox(task, newVal);
      },
      secondary: IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          var state = Provider.of<MyState>(context, listen: false);
          state.removeTask(task);
        },
      ),
    ),
  );
}
