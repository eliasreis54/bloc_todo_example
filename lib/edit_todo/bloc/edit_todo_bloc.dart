import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'edit_todo_event.dart';
part 'edit_todo_state.dart';

class EditTodoBloc extends Bloc<EditTodoEvent, EditTodoState> {
  EditTodoBloc() : super(const EditTodoState.initial()) {
    on<EditTodoEventDescriptionChanged>(_onDescriptionChanged);
    on<EditTodoEventNameChanged>(_onNameChanged);
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
}
