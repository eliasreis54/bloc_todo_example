import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Todo extends Equatable {
  final String? id;
  final String name;
  final String description;
  final bool isConcluded;

  Todo({
    String? id,
    required this.name,
    this.description = '',
    this.isConcluded = false,
  })  : assert(
          id == null || id.isNotEmpty,
          'id can not be null',
        ),
        id = id ?? const Uuid().v4();

  @override
  List<Object?> get props => [id, name, description, isConcluded];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'isConcluded': isConcluded,
    };
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      isConcluded: json['isConcluded'],
    );
  }
}
