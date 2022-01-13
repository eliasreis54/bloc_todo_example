import 'package:flutter_test/flutter_test.dart';
import 'package:todo_api/todo_api.dart';

void main() {
  test('Should map toJson correctly', () {
    final todo = Todo(
      id: 'id',
      name: 'name',
      description: 'description',
    );

    final todoMap = {
      'id': 'id',
      'name': 'name',
      'description': 'description',
      'isConcluded': false,
    };

    expect(todo.toJson(), todoMap);
  });

  test('Should return Todo Object correctly', () {
    final todoMap = {
      'id': 'id',
      'name': 'name',
      'description': 'description',
      'isConcluded': true,
    };

    final todo = Todo.fromJson(todoMap);

    expect(
      todo,
      isA<Todo>()
          .having((t) => t.name, 'name', 'name')
          .having((t) => t.description, 'description', 'description')
          .having((t) => t.id, 'id', 'id')
          .having((t) => t.isConcluded, 'isConcluded', true),
    );
  });

  test('Should validate empty id', () {
    final todo = Todo(id: '', name: 'name');
    expect(todo.id, isNotEmpty);
  });
}
