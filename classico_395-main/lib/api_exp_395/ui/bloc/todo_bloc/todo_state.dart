import 'package:classico_395/api_exp_395/data/remote/model/todo_model.dart';

abstract class TodoState{}

class TodoInitialState extends TodoState{}

class TodoLoadingState extends TodoState{}

class TodoLoadedState extends TodoState{
  List<TodoModel> allTodos;
  TodoLoadedState({required this.allTodos});
}

class TodoErrorState extends TodoState{
  String errorMsg;
  TodoErrorState({required this.errorMsg});
}
