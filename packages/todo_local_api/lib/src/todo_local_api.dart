import 'package:todo_api/todo_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoLocalApi extends TodoApi {
  final SharedPreferences sharedPreferences;

  const TodoLocalApi({
    required this.sharedPreferences,
  });

  @override
  Future<List<Todo>> getTodos() {
    // TODO: implement getTodos
    throw UnimplementedError();
  }

  @override
  Future<void> saveTodo(Todo todo) {
    // TODO: implement saveTodo
    throw UnimplementedError();
  }
}
