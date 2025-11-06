import 'package:classico_395/GlobalState/todo_bloc_395/bloc/todo_event.dart';
import 'package:classico_395/GlobalState/todo_bloc_395/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'bloc/todo_bloc.dart';
import 'bloc/todo_state.dart';

class HomePageExpenso extends StatefulWidget {
  const HomePageExpenso({super.key});

  @override
  State<HomePageExpenso> createState() => _HomePageExpensoState();
}

class _HomePageExpensoState extends State<HomePageExpenso> {

  @override
  void initState() {
    super.initState();
    context.read<TodoBloc>().add(FetchAllTodoEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Todo")),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (_, state) {
          if (state is TodoLoadingState) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is TodoErrorState) {
            return Center(child: Text(state.errorMsg));
          }

          if (state is TodoLoadedState) {
            return state.mTodos.isNotEmpty
                ? ListView.builder(
              itemCount: state.mTodos.length,
                    itemBuilder: (_, index) {
                      return Card(
                        child: CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.trailing,
                          value: state.mTodos[index].isCompleted,
                          onChanged: (value) {
                            context.read<TodoBloc>().add(
                              ToggleTodoEvent(
                                id: state.mTodos[index].id!,
                                isCompleted: value ?? false,
                              ),
                            );
                          },
                          title: Text("${state.mTodos[index].id}. ${state.mTodos[index].title}"),
                          subtitle: Text(state.mTodos[index].description),
                        ),
                      );
                    },
                  )
                : Center(child: Text('No Todo\'s yet'));
          }

          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<TodoBloc>().add(
            AddTodoEvent(
              newTodo: Todo(
                title: "My todo",
                description: "Complete Todo app with Bloc and DB",
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
