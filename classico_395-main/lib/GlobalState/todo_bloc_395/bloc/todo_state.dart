import 'package:classico_395/GlobalState/todo_bloc_395/model/todo_model.dart';

abstract class TodoState{}

class TodoInitialState extends TodoState{}
class TodoLoadingState extends TodoState{}
class TodoLoadedState extends TodoState{
  List<Todo> mTodos;
  TodoLoadedState({required this.mTodos});
}
class TodoErrorState extends TodoState{
  String errorMsg;
  TodoErrorState({required this.errorMsg});
}