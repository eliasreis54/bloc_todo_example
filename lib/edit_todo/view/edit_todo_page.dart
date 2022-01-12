import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/edit_todo/bloc/edit_todo_bloc.dart';

class EditTodoPage extends StatelessWidget {
  const EditTodoPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(builder: (BuildContext context) {
      return BlocProvider<EditTodoBloc>(
        create: (_) => EditTodoBloc(),
        child: const EditTodoView(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const EditTodoView();
  }
}

class EditTodoView extends StatelessWidget {
  const EditTodoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<EditTodoBloc>().state;
    final bloc = context.read<EditTodoBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit or create Todo page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: 'Name'),
              onChanged: (value) {
                bloc.add(EditTodoEventNameChanged(value));
              },
            ),
            TextFormField(
              initialValue: state.description,
              decoration: const InputDecoration(hintText: 'Description'),
              maxLines: 7,
              maxLength: 300,
              onChanged: (value) {
                bloc.add(EditTodoEventDescriptionChanged(value));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.check),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
