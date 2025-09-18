import 'package:classico_395/GlobalState/expenso_395/ui/add_expense/add_expense_page.dart';
import 'package:classico_395/GlobalState/expenso_395/ui/dashboard/nav_pages/dash_board_page.dart';
import 'package:classico_395/GlobalState/expenso_395/ui/login/login_page.dart';
import 'package:classico_395/GlobalState/expenso_395/ui/signup/sign_up_page.dart' show SignUpPage;
import 'package:classico_395/GlobalState/expenso_395/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import '../ui/dashboard/nav_pages/home/home_page.dart';

class AppRoutes{

  static const String splash = '/splash';
  static const String home = '/home';
  static const String dashboard = '/dashboard';
  static const String addExpense = "/add_expense";
  static const String login = '/login';
  static const String register = '/register';


  static Map<String, WidgetBuilder> getRoutes() => {
    splash: (context) => SplashPage(),
    login: (context) => LoginPage(),
    register: (context) => SignUpPage(),
    home: (context) => HomePage(),
    dashboard: (context) => DashBoardPage(),
    addExpense: (context) => AddExpensePage(),
  };

}