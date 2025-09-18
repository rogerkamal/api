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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.getRoutes(),
    );
  }
}
