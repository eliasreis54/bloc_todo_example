import 'package:todo_api/todo_api.dart';

abstract class TodoApi {
  const TodoApi();

  Future<void> saveTodo(Todo todo);

  Stream<List<Todo>> getTodos();
}
