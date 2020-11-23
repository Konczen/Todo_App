import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AddView.dart';
import 'ToDoList.dart';
import 'model.dart';

class Mainview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myAppBar(context),
      body: Center(
        child: Consumer<MyState>(
          builder: (context, state, child) =>
              ToDoList(_filterList(state.list, state.startOption),
        ),
      )),
      floatingActionButton: _addViewButton(context),
    );
  }

  Widget _addViewButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add, size: 40),
      onPressed: () async {
        var newTask = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddView(OneTask(
                      message: '',
                    ))));
        if (newTask != null) {
          Provider.of<MyState>(context, listen: false).addTask(newTask);
        }
      },
    );
  }

  Widget _myAppBar(context) {
    return AppBar(
        centerTitle: true,
        title: Text(
          'TIG169 TODO',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          _popup(context),
        ],
      );
  }

  final List<String> options = ['All', 'Done', 'Undone'];

  Widget _popup(context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        Provider.of<MyState>(context, listen: false).setFilterBy(value);
      },
      itemBuilder: (BuildContext context) {
        return options.map((options) =>
                PopupMenuItem(value: options, child: Text(options))).toList();
      },
      icon: Icon(
        Icons.more_vert,
        size: 30,
        color: Colors.black,
      ),
    );
  }
  
    List<OneTask> _filterList(list, options) {
    if (options == "Done") {
      return list.where((task) => task.value == true).toList();
    } else if (options == "Undone") {
      return list.where((task) => task.value == false).toList();
    }
    return list;
  }
}
