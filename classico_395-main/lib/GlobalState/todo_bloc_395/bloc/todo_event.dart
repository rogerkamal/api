import 'package:classico_395/GlobalState/todo_bloc_395/model/todo_model.dart';


abstract class TodoEvent{}

class AddTodoEvent extends TodoEvent{
  Todo newTodo;
  AddTodoEvent({required this.newTodo});
}

class FetchAllTodoEvent extends TodoEvent{}

class ToggleTodoEvent extends TodoEvent{
  int id;
  bool isCompleted;
  ToggleTodoEvent({required this.id, required this.isCompleted});
}

/*
class UpdateTodoEvent extends TodoEvent{}

class DeleteTodoEvent extends TodoEvent{}*/
