import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo_api/todo_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rxdart/subjects.dart';

class TodoLocalApi extends TodoApi {
  @visibleForTesting
  static const kTodoKey = '889dc94c-af8f-4b0f-be88-fbc14c78520f';

  final _todosController = BehaviorSubject<List<Todo>>.seeded(const []);

  final SharedPreferences sharedPreferences;

  TodoLocalApi({
    required this.sharedPreferences,
  }) {
    _init();
  }

  String? _getValue() => sharedPreferences.getString(kTodoKey);
  void _setValue(String value) => sharedPreferences.setString(kTodoKey, value);

  Future<void> _init() async {
    final retrievedTodos = _getValue();
    if (retrievedTodos != null) {
      final data = jsonDecode(retrievedTodos) as List;

      final todos = List<Map>.from(data).map((e) {
        return Todo.fromJson(Map<String, dynamic>.from(e));
      }).toList();

      _todosController.add(todos);
    }
  }

  @override
  Future<void> saveTodo(Todo todo) async {
    final _todos = _todosController.value;

    final data = [..._todos, todo];

    _setValue(jsonEncode(data.map((e) => e.toJson()).toList()));

    _todosController.add(data);
  }

  @override
  Stream<List<Todo>> getTodos() => _todosController.asBroadcastStream();
}
