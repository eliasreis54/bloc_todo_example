import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_api/todo_api.dart';
import 'package:todo_bloc/home/home.dart';
import 'package:todo_repository/todo_repository.dart';

class App extends StatelessWidget {
  final TodoApi todoApi;

  const App({
    Key? key,
    required this.todoApi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => TodoRepository(todoApi: todoApi),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
