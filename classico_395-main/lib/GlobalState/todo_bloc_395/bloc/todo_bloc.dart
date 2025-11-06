import 'package:classico_395/GlobalState/todo_bloc_395/bloc/todo_event.dart';
import 'package:classico_395/GlobalState/todo_bloc_395/bloc/todo_state.dart';
import 'package:classico_395/GlobalState/todo_bloc_395/db_helper.dart';
import 'package:classico_395/GlobalState/todo_bloc_395/model/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class TodoBloc extends Bloc<TodoEvent, TodoState>{
  DatabaseHelper dbHelper;
  TodoBloc({required this.dbHelper}) : super(TodoInitialState()){

    on<AddTodoEvent>((event, emit) async{
      emit(TodoLoadingState());

      bool check =await dbHelper.insertTodo(todo: event.newTodo);

      if(check){
        List<Todo> mTodos = await dbHelper.getTodos();
        emit(TodoLoadedState(mTodos: mTodos));
        // add(FetchAllTodoEvent());
      } else {
        emit(TodoErrorState(errorMsg: "Something went wrong!"));
      }

    });

    on<FetchAllTodoEvent>((event, emit) async{
      List<Todo> mTodos = await dbHelper.getTodos();
      emit(TodoLoadedState(mTodos: mTodos));
    });

    on<ToggleTodoEvent>((event, emit) async{
      bool check = await dbHelper.toggleTodoStatus(event.id, event.isCompleted);

      if(check){
        List<Todo> mTodos = await dbHelper.getTodos();
        emit(TodoLoadedState(mTodos: mTodos));
      } else {
        emit(TodoErrorState(errorMsg: "Something went wrong!"));
      }

    });

    ///filter

  }

}