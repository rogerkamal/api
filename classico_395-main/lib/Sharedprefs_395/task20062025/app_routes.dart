import 'package:classico_395/Sharedprefs_395/task20062025/homePagetask20062025.dart';
import 'package:classico_395/Sharedprefs_395/task20062025/loginPagetask20062025.dart';
import 'package:classico_395/Sharedprefs_395/task20062025/splashtask20062025.dart';
import 'package:flutter/material.dart';

class AppRoutes{


  static const String SPLASH = "/splash";
  static const String LOGIN = "/loginPage";
  static const String HOME = "/homePage";

  static Map<String, Widget Function(BuildContext)> pageRoutes() =>{
    SPLASH : (_) => Splashtask20062025(),
    LOGIN : (_) => LoginPagetask20062025(),
    HOME : (_) => HomePagetask20062025(),
  };

}