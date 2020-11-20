import 'package:flutter/material.dart';

import './model.dart';

class AddView extends StatefulWidget {
  final OneTask task;
  AddView(this.task);

  @override
  State<StatefulWidget> createState() {
    return AddViewState(task);
  }
}

class AddViewState extends State<AddView> {
  String message;
  TextEditingController textEditingController;

  AddViewState(OneTask task) {
    this.message = task.message;

    textEditingController = TextEditingController(text: task.message);

    textEditingController.addListener(() {
      setState(() {
        message = textEditingController.text;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _mySecondAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _taskInputField(),
            Container(height: 40),
            _addbutton(),
          ],
        ),
      ),
    );
  }

  Widget _mySecondAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
      centerTitle: true,
      title: Text(
        'TIG169 TODO',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _taskInputField() {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 25, right: 25),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 4.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2.0),
            ),
            border: OutlineInputBorder(),
            hintText: 'What are you going to do?'),
      ),
    );
  }

  Widget _addbutton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlatButton.icon(
          onPressed: () {
            Navigator.pop(context, OneTask(message: message));
          },
          icon: Icon(Icons.add),
          label: Text('ADD',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ),
      ],
    );
  }
}
