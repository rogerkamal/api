import 'package:classico_395/Sharedprefs_395/task20062025/app_routes.dart';
import 'package:classico_395/Sharedprefs_395/task20062025/splashtask20062025.dart';
import 'package:flutter/material.dart';

void main(){

  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Task20June",
      // home: Splashtask20062025(),
      initialRoute: AppRoutes.SPLASH,
      routes: AppRoutes.pageRoutes(),
    );
  }
}