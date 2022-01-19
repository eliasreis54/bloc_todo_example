import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_api/todo_api.dart';
import 'package:todo_local_api/todo_local_api.dart';

class MockSharedPrefs extends Mock implements SharedPreferences {}

void main() {
  late SharedPreferences sharedPref;

  setUp(() {
    sharedPref = MockSharedPrefs();
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
      final todoLocalApi = TodoLocalApi(sharedPreferences: sharedPref);

      final retrievedTodos = todoLocalApi.getTodos();

      expect(retrievedTodos, emits(todos));
    });

    test('Should return a empty list of todos when storage is empty', () {
      when(() => sharedPref.getString(any())).thenReturn(jsonEncode([]));
      final todoLocalApi = TodoLocalApi(sharedPreferences: sharedPref);

      final retrievedTodos = todoLocalApi.getTodos();

      expect(retrievedTodos, emits([]));
    });

    test('Should return a empty list of todos when storage is empty', () {
      when(() => sharedPref.getString(any())).thenReturn(null);
      final todoLocalApi = TodoLocalApi(sharedPreferences: sharedPref);

      final retrievedTodos = todoLocalApi.getTodos();

      expect(retrievedTodos, emits([]));
    });
  });

  group('saveTodo', () {
    test('Should call sharedPref with correct data', () {
      when(() => sharedPref.getString(any())).thenReturn(jsonEncode(todos));
      when(() => sharedPref.setString(TodoLocalApi.kTodoKey, any()))
          .thenAnswer((_) => Future.value(true));

      final api = TodoLocalApi(sharedPreferences: sharedPref);

      expect(api.getTodos(), emits(todos));

      api.saveTodo(todos[0]);

      expect(api.getTodos(), emits([...todos, todos[0]]));

      final data =
          jsonEncode([...todos.map((e) => e.toJson()), todos[0].toJson()]);

      verify(() => sharedPref.setString(TodoLocalApi.kTodoKey, data)).called(1);
    });
  });
}
