part of 'edit_todo_bloc.dart';

abstract class EditTodoEvent extends Equatable {
  const EditTodoEvent();
}

class EditTodoEventNameChanged extends EditTodoEvent {
  final String name;

  const EditTodoEventNameChanged(this.name);

  @override
  List<Object?> get props => [name];
}

class EditTodoEventDescriptionChanged extends EditTodoEvent {
  final String description;

  const EditTodoEventDescriptionChanged(this.description);

  @override
  List<Object?> get props => [description];
}

class EditTodoEventSubimited extends EditTodoEvent {
  const EditTodoEventSubimited();

  @override
  List<Object?> get props => [];
}
