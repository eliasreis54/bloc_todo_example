import 'package:flutter/material.dart';
import 'package:todo_api/todo_api.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  const TodoItem({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: todo.isConcluded,
        onChanged: (bool? value) {},
      ),
      title: Text(todo.name),
      subtitle: Text(
        todo.description,
        style: const TextStyle(
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
