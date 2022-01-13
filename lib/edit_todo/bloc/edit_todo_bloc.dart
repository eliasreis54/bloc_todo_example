import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_api/todo_api.dart';
import 'package:todo_repository/todo_repository.dart';

part 'edit_todo_event.dart';
part 'edit_todo_state.dart';

class EditTodoBloc extends Bloc<EditTodoEvent, EditTodoState> {
  final TodoRepository repository;

  EditTodoBloc({
    required this.repository,
  }) : super(const EditTodoState.initial()) {
    on<EditTodoEventDescriptionChanged>(_onDescriptionChanged);
    on<EditTodoEventNameChanged>(_onNameChanged);
    on<EditTodoEventSubimited>(_onTodoSubmited);
  }

  void _onNameChanged(
    EditTodoEventNameChanged event,
    Emitter<EditTodoState> emit,
  ) {
    emit(state.copyWith(
      name: event.name,
    ));
  }

  void _onDescriptionChanged(
    EditTodoEventDescriptionChanged event,
    Emitter<EditTodoState> emit,
  ) {
    emit(state.copyWith(
      description: event.description,
    ));
  }

  void _onTodoSubmited(
    EditTodoEventSubimited event,
    Emitter<EditTodoState> emit,
  ) async {
    emit(state.copyWith(status: EditTodoStatus.inProgress));
    try {
      await repository.saveTodo(
        Todo(
          name: state.name,
          description: state.description,
        ),
      );
      emit(state.copyWith(status: EditTodoStatus.success));
    } catch (_) {
      emit(state.copyWith(status: EditTodoStatus.failure));
    }
  }
}
