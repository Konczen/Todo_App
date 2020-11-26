import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'MainView.dart';
import 'model.dart';


void main() {
  
  var state = MyState();
  state.getList();
  
  runApp(ChangeNotifierProvider(
    create: (context) => state,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      primarySwatch: Colors.grey,
      visualDensity: VisualDensity.adaptivePlatformDensity,        
      ),
      home: Mainview(),
    );
  }
}
