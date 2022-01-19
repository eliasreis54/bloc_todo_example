import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_api/todo_api.dart';

import 'package:todo_repository/todo_repository.dart';

class MockTodoApi extends Mock implements TodoApi {}

void main() {
  late TodoApi todoApi;
  late TodoRepository repository;

  setUp(() {
    todoApi = MockTodoApi();
    repository = TodoRepository(todoApi: todoApi);
  });

  test('Should call todoApi when save todo', () {
    final todo = Todo(
      name: 'name',
      description: 'description',
      id: '12',
      isConcluded: false,
    );

    when(() => todoApi.saveTodo(todo)).thenAnswer((_) async => {});

    repository.saveTodo(todo);

    verify(() => todoApi.saveTodo(todo)).called(1);
  });

  test('Should call todoApi when get todos', () {
    when(() => todoApi.getTodos()).thenAnswer((_) => Stream.value([]));

    repository.getTodos();

    verify(() => todoApi.getTodos()).called(1);
  });
}
