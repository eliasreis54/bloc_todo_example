import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final String? id;
  final String name;
  final String description;
  final bool isConcluded;

  const Todo({
    this.id,
    required this.name,
    this.description = '',
    this.isConcluded = false,
  });

  @override
  List<Object?> get props => [id, name, description, isConcluded];
}
