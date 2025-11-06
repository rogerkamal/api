import 'package:classico_395/api_exp_395/data/remote/helper/api_helper.dart';
import 'package:classico_395/api_exp_395/data/remote/model/todo_model.dart';
import 'package:classico_395/api_exp_395/domain/constants/urls.dart';
import 'package:classico_395/api_exp_395/ui/bloc/todo_bloc/todo_event.dart';
import 'package:classico_395/api_exp_395/ui/bloc/todo_bloc/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvent,TodoState>{
  ApiHelper apiHelper;

  TodoBloc({required this.apiHelper}) : super(TodoInitialState()){
    on<GetAllTodosEvent>((event, emit) async {
      emit(TodoLoadingState());

      try{
        dynamic mData = await apiHelper.getApi(url: Urls.todoUrl);

        TodoDataModel todoDataModel = TodoDataModel.fromJson(mData);

        emit(TodoLoadedState(allTodos: todoDataModel.todos));
      } catch(e){

        emit(TodoErrorState(errorMsg: e.toString()));
      }
    });
  }
}