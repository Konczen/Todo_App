import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model.dart';

const API_URL = 'https://todoapp-api-vldfm.ondigitalocean.app';
const API_KEY = '8797aae3-8355-4a5b-880e-1d7c8713762e';

class Api {
  static Future addTask(OneTask task) async {
    var json = jsonEncode(OneTask.toJson(task));
    await http.post(
      '$API_URL/todos?key=$API_KEY',
      body: json,
      headers: {'Content-Type': 'application/json'},
    );
  }

  static Future removeTask(String taskId) async {
    await http.delete('$API_URL/todos/$taskId?key=$API_KEY');
  }

  static Future updateTask(OneTask task, taskId) async {
    var json = jsonEncode(OneTask.toJson(task));
    await http.put(
      '$API_URL/todos/$taskId?key=$API_KEY',
      body: json,
      headers: {'Content-Type': 'application/json'},
    );
  }

  static Future<List<OneTask>> getTasks() async {
    var response = await http.get('$API_URL/todos?key=$API_KEY');
    var json = jsonDecode(response.body);
    return json.map<OneTask>((data) {
      return OneTask.fromJson(data);
    }).toList();
  }
}
