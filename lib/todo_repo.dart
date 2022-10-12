import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo/todo_model.dart';

class TodoRepo {
  String baseUrl = "https://jsonplaceholder.typicode.com/todos";

  Future<List> getAllTodos() async {
    http.Response res = await http.get(Uri.parse(baseUrl));
    return jsonDecode(res.body);
  }

  Future<TodoModel> getSingleTodo({required int id}) async {
    http.Response res = await http.get(Uri.parse("$baseUrl/$id"));
    return TodoModel.fromJson(jsonDecode(res.body));
  }
}
