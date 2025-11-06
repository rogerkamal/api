import 'package:classico_395/GlobalState/expenso_395/data/local/helper/db_helper.dart';
import 'package:classico_395/GlobalState/expenso_395/data/local/repo/expense_repo.dart';
import 'package:classico_395/GlobalState/expenso_395/data/local/repo/user_repo.dart';
import 'package:classico_395/GlobalState/expenso_395/ui/bloc/user_bloc.dart';
import 'package:classico_395/GlobalState/expenso_395/ui/dashboard/nav_pages/bloc/expense_bloc.dart';
import 'package:classico_395/GlobalState/expenso_395/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(
            userRepo: UserRepository(dbHelper: DBHelper.getInstance()),
          ),
        ),
        BlocProvider(
          create: (context) => ExpenseBloc(
            expenseRepository: ExpenseRepository(
              dbHelper: DBHelper.getInstance(),
            ),
          ),
        ),
      ],
      child: const MyApp(),
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
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.getRoutes(),
    );
  }
}
