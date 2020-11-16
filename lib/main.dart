import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Mainview(),
    );
  }
}

class Mainview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: Text(
          'TIG169 TODO',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          _popup(),
        ],
      ),
      body: _todoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddView()));
        },
        child: Icon(Icons.add, size: 40),
        backgroundColor: Colors.grey,
      ),
    );
  }

  Widget _popup() {
    return PopupMenuButton<String>(
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Text('All'),
        ),
        PopupMenuItem(
          child: Text('Done'),
        ),
        PopupMenuItem(
          child: Text('Undone'),
        ),
      ],
      icon: Icon(
        Icons.more_vert,
        size: 30,
        color: Colors.black,
      ),
    );
  }

//Koppla listan till min addButton
  Widget _todoList() {
    var todos = [
      'Write a book',
      'Do homework',
      'Tidy room',
      'Watch TV',
      'Nap',
      'Shop groceries',
      'Have fun',
      'Meditate',
    ];

    return ListView(
      children: todos.map((item) => _item(item)).toList(),
    );
  }

//Köra den på stateful istället, ändra value och lägga till setState
//Fixa onPressed på IconButton, skapa en till funktion som tar bort
//Lägga till funktion genom att dra en linje igenom texten om todon är klar
  Widget _item(text) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(
        text,
        style: TextStyle(fontSize: 24),
      ),
      value: false,
      onChanged: (val) {},
      secondary: IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {},
      ),
    );
  }
}

class AddView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: Text(
          'TIG169 TODO',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_taskInputField(), Container(height: 40), _addbutton()],
        ),
      ),
    );
  }
}

Widget _taskInputField() {
  return Container(
    margin: EdgeInsets.only(top: 30, left: 25, right: 25),
    child: TextField(
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
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    FlatButton.icon(
      onPressed: (
          //Lägga till funktion så att den lägger till en task på första sidan
          ) {},
      icon: Icon(Icons.add),
      label: Text('ADD',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
    ),
  ]);
}
