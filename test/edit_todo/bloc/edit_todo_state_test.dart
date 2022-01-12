import 'package:flutter_test/flutter_test.dart';
import 'package:todo_bloc/edit_todo/bloc/edit_todo_bloc.dart';

void main() {
  group('EditTodoState', () {
    test('Should copyWith with correct data', () {
      const state = EditTodoState();

      expect(state.name, '');
      expect(state.description, '');

      final newState = state.copyWith(
        name: 'name',
        description: 'description',
      );

      expect(state == newState, isFalse);
    });
  });
}
