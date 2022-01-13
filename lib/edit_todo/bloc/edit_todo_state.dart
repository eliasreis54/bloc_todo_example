part of 'edit_todo_bloc.dart';

enum EditTodoStatus {
  initial,
  success,
  failure,
  inProgress,
}

class EditTodoState extends Equatable {
  const EditTodoState({
    this.name = '',
    this.description = '',
    this.status = EditTodoStatus.initial,
  });

  final String name;
  final String description;
  final EditTodoStatus status;

  const EditTodoState.initial() : this();

  @override
  List<Object> get props => [name, description, status];

  EditTodoState copyWith({
    String? name,
    String? description,
    EditTodoStatus? status,
  }) {
    return EditTodoState(
      name: name ?? this.name,
      description: description ?? this.description,
      status: status ?? this.status,
    );
  }
}
