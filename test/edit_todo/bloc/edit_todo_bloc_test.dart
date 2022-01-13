import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_api/todo_api.dart';
import 'package:todo_bloc/edit_todo/bloc/edit_todo_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_repository/todo_repository.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  late TodoRepository repository;

  setUp(() {
    repository = MockTodoRepository();
  });

  setUpAll(() {
    registerFallbackValue(Todo(name: ''));
  });

  group('EditTodoBloc test', () {
    blocTest<EditTodoBloc, EditTodoState>(
      'Should emit nothing  whem bloc created',
      build: () => EditTodoBloc(
        repository: repository,
      ),
      expect: () => [],
    );

    blocTest<EditTodoBloc, EditTodoState>(
      'Should emit new state with no empty name whem name updated',
      build: () => EditTodoBloc(
        repository: repository,
      ),
      act: (bloc) => bloc.add(
        const EditTodoEventNameChanged('new name'),
      ),
      expect: () => [
        const EditTodoState(name: 'new name'),
      ],
    );

    blocTest<EditTodoBloc, EditTodoState>(
      'Should emit new state with no empty decoration whem name updated',
      build: () => EditTodoBloc(
        repository: repository,
      ),
      act: (bloc) => bloc.add(
        const EditTodoEventDescriptionChanged('new description'),
      ),
      expect: () => [
        const EditTodoState(description: 'new description'),
      ],
    );
  });

  group('EditTodoBloc save todo test', () {
    blocTest<EditTodoBloc, EditTodoState>(
      'Should call repository when a EditTodoEventSubimited event is added and emit success',
      build: () {
        when(() => repository.saveTodo(any())).thenAnswer((_) async => {});
        return EditTodoBloc(
          repository: repository,
        );
      },
      act: (bloc) {
        bloc.add(const EditTodoEventNameChanged('new name'));
        bloc.add(const EditTodoEventDescriptionChanged('new description'));
        bloc.add(const EditTodoEventSubimited());
      },
      expect: () {
        const name = 'new name';
        const description = 'new description';

        return [
          const EditTodoState(name: name),
          const EditTodoState(description: description, name: name),
          const EditTodoState(
            description: description,
            name: name,
            status: EditTodoStatus.inProgress,
          ),
          const EditTodoState(
            description: description,
            name: name,
            status: EditTodoStatus.success,
          ),
        ];
      },
      verify: (_) {
        verify(() => repository.saveTodo(any())).called(1);
      },
    );

    blocTest<EditTodoBloc, EditTodoState>(
      'Should call repository when a EditTodoEventSubimited event is added and emit failure',
      build: () {
        when(() => repository.saveTodo(any())).thenThrow(Exception);
        return EditTodoBloc(
          repository: repository,
        );
      },
      act: (bloc) {
        bloc.add(const EditTodoEventNameChanged('new name'));
        bloc.add(const EditTodoEventDescriptionChanged('new description'));
        bloc.add(const EditTodoEventSubimited());
      },
      expect: () {
        const name = 'new name';
        const description = 'new description';

        return [
          const EditTodoState(name: name),
          const EditTodoState(description: description, name: name),
          const EditTodoState(
            description: description,
            name: name,
            status: EditTodoStatus.inProgress,
          ),
          const EditTodoState(
            description: description,
            name: name,
            status: EditTodoStatus.failure,
          ),
        ];
      },
      verify: (_) {
        verify(() => repository.saveTodo(any())).called(1);
      },
    );
  });
}
