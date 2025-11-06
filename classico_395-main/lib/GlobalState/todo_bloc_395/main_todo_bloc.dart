import 'package:classico_395/GlobalState/todo_bloc_395/bloc/todo_bloc.dart';
import 'package:classico_395/GlobalState/todo_bloc_395/db_helper.dart';
import 'package:classico_395/GlobalState/todo_bloc_395/home_page_todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(
    BlocProvider(
      create: (context) => TodoBloc(dbHelper: DatabaseHelper.instance),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePageExpenso(),
    );
  }
}
