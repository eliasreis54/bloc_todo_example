import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_api/todo_api.dart';
import 'package:todo_local_api/todo_local_api.dart';

class MockSharedPrefs extends Mock implements SharedPreferences {}

void main() {
  late SharedPreferences sharedPref;
  late TodoLocalApi todoLocalApi;

  setUp(() {
    sharedPref = MockSharedPrefs();
    todoLocalApi = TodoLocalApi(sharedPreferences: sharedPref);
  });

  final todos = [
    Todo(
      name: 'name',
      id: 'id',
      description: 'description',
      isConcluded: false,
    ),
    Todo(
      name: 'name',
      id: 'id',
      description: 'description',
      isConcluded: false,
    ),
  ];

  group('getTodos', () {
    test('Should return a list of todos when storage is not empty', () async {
      when(() => sharedPref.getString(any())).thenReturn(jsonEncode(todos));

      final retrievedTodos = await todoLocalApi.getTodos();

      expect(retrievedTodos, isA<List<Todo>>());
      expect(retrievedTodos.length, 2);
      expect(retrievedTodos, todos);
      expect(todoLocalApi.todos, todos);
    });

    test('Should return a empty list of todos when storage is empty', () async {
      when(() => sharedPref.getString(any())).thenReturn(jsonEncode([]));

      final retrievedTodos = await todoLocalApi.getTodos();

      expect(retrievedTodos, isA<List<Todo>>());
      expect(retrievedTodos.length, 0);
    });

    test('Should return a empty list of todos when storage is empty', () async {
      when(() => sharedPref.getString(any())).thenReturn(null);

      final retrievedTodos = await todoLocalApi.getTodos();

      expect(retrievedTodos, isA<List<Todo>>());
      expect(retrievedTodos.length, 0);
    });
  });

  group('saveTodo', () {
    test('Should call sharedPref with correct data', () {
      when(() => sharedPref.getString(any())).thenReturn(jsonEncode(todos));
      when(() => sharedPref.setString(TodoLocalApi.kTodoKey, any()))
          .thenAnswer((_) => Future.value(true));

      final api = TodoLocalApi(sharedPreferences: sharedPref);

      expect(api.todos, todos);

      api.saveTodo(todos[0]);

      expect(api.todos.length, 3);

      final data =
          jsonEncode([...todos.map((e) => e.toJson()), todos[0].toJson()]);

      verify(() => sharedPref.setString(TodoLocalApi.kTodoKey, data)).called(1);
    });
  });
}
