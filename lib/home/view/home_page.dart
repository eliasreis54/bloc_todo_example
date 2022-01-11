import 'package:flutter/material.dart';
import 'package:todo_bloc/todo_overview/todo_overview.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo bloc'),
      ),
      body: const Center(
        child: TodoOverviewPage(),
      ),
    );
  }
}
