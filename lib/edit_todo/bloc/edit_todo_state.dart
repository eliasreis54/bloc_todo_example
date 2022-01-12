part of 'edit_todo_bloc.dart';

class EditTodoState extends Equatable {
  const EditTodoState({
    this.name = '',
    this.description = '',
  });

  final String name;
  final String description;

  const EditTodoState.initial() : this();

  @override
  List<Object> get props => [name, description];

  EditTodoState copyWith({
    String? name,
    String? description,
  }) {
    return EditTodoState(
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }
}
