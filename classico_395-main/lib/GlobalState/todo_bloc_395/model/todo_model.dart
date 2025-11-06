class Todo {
  int? id;
  final String title;
  final String description;
  final bool isCompleted;
  final DateTime createdAt;
  DateTime? completedAt;

  Todo({
    this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
    DateTime? createdAt,
    this.completedAt,
  }) : createdAt = createdAt ?? DateTime.now();

  // Convert a Todo into a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'is_completed': isCompleted ? 1 : 0,
      'created_at': createdAt.toIso8601String(),
      'completed_at': completedAt?.toIso8601String(),
    };
  }

  // Create a Todo from a Map
  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      isCompleted: map['is_completed'] == 1,
      createdAt: DateTime.parse(map['created_at']),
      completedAt: map['completed_at'] != null 
          ? DateTime.parse(map['completed_at']) 
          : null,
    );
  }

  /*// Create a copy of a Todo with some changed properties
  Todo copyWith({
    int? id,
    String? title,
    String? description,
    bool? isCompleted,
    DateTime? createdAt,
    DateTime? completedAt,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
    );
  }*/
}
