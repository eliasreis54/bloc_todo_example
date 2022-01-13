import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/home/home.dart';
import 'package:todo_repository/todo_repository.dart';

class App extends StatelessWidget {
  final TodoRepository todoRepository;

  const App({
    Key? key,
    required this.todoRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: todoRepository,
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
