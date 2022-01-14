import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo_api/todo_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoLocalApi extends TodoApi {
  @visibleForTesting
  static const kTodoKey = '889dc94c-af8f-4b0f-be88-fbc14c78520f';

  final List<Todo> _todos = [];

  final SharedPreferences sharedPreferences;

  TodoLocalApi({
    required this.sharedPreferences,
  }) {
    _init();
  }

  List<Todo> get todos => _todos;

  String? _getValue() => sharedPreferences.getString(kTodoKey);
  void _setValue(String value) => sharedPreferences.setString(kTodoKey, value);

  Future<void> _init() async {
    getTodos();
  }

  @override
  Future<List<Todo>> getTodos() async {
    final todos = _getValue();
    if (todos != null) {
      final data = jsonDecode(todos) as List;

      return List<Map>.from(data).map((e) {
        final todo = Todo.fromJson(Map<String, dynamic>.from(e));
        _todos.add(todo);
        return todo;
      }).toList();
    } else {
      return [];
    }
  }

  @override
  Future<void> saveTodo(Todo todo) async {
    _todos.add(todo);

    final data = _todos.map((e) => e.toJson()).toList();

    _setValue(jsonEncode(data));
  }
}
