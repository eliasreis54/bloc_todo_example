import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_bloc/edit_todo/bloc/edit_todo_bloc.dart';

void main() {
  group('EditTodoBloc test', () {
    blocTest<EditTodoBloc, EditTodoState>(
      'Should emit nothing  whem bloc created',
      build: () => EditTodoBloc(),
      expect: () => [],
    );

    blocTest<EditTodoBloc, EditTodoState>(
      'Should emit new state with no empty name whem name updated',
      build: () => EditTodoBloc(),
      act: (bloc) => bloc.add(
        const EditTodoEventNameChanged('new name'),
      ),
      expect: () => [
        const EditTodoState(name: 'new name'),
      ],
    );

    blocTest<EditTodoBloc, EditTodoState>(
      'Should emit new state with no empty decoration whem name updated',
      build: () => EditTodoBloc(),
      act: (bloc) => bloc.add(
        const EditTodoEventDescriptionChanged('new description'),
      ),
      expect: () => [
        const EditTodoState(description: 'new description'),
      ],
    );
  });
}
