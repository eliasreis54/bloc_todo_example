import 'package:flutter/material.dart';
import 'package:todo_api/todo_api.dart';
import 'package:todo_bloc/todo_overview/widgets/widgets.dart';

class TodoOverviewPage extends StatelessWidget {
  const TodoOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo bloc'),
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: TodoItem(
              todo: Todo(
                name: 'Todo $index',
                description: 'Todo description $index',
              ),
            ),
          );
        },
      ),
    );
  }
}
