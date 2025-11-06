import 'package:classico_395/TodoApp/homepage_todo.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: "To Do App",
     home: HomepageTodo(),
   );
  }
}