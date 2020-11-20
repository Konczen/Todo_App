import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AddView.dart';
import 'ToDoList.dart';
import 'model.dart';

class Mainview extends StatefulWidget {
  @override
  _MainviewState createState() => _MainviewState();
}

class _MainviewState extends State<Mainview> {
  final List<String> options = ['All', 'Done', 'Undone'];
  String startOption = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myAppBar(),
      body: Center(
        child: Consumer<MyState>(
          builder: (context, state, child) =>
              ToDoList(state.filterList(startOption)),
        ),
      ),
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

  Widget _myAppBar() {
    return AppBar(
        centerTitle: true,
        title: Text(
          'TIG169 TODO',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          _popup(),
        ],
      );
  }

  Widget _popup() {
    return PopupMenuButton<String>(
      onSelected: (String value) {
        setState(() {
          startOption = value;
        });
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
}
