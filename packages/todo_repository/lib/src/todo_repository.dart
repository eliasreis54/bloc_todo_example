import 'package:todo_api/todo_api.dart';

class TodoRepository {
  final TodoApi todoApi;
  const TodoRepository({
    required this.todoApi,
  });

  Future<void> saveTodo(Todo todo) async {
    await todoApi.saveTodo(todo);
  }

  Future<List<Todo>> getTodos() async {
    final todos = await todoApi.getTodos();
    return todos;
  }
}
