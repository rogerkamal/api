import 'package:classico_395/api_exp_395/data/remote/helper/api_helper.dart';
import 'package:classico_395/api_exp_395/ui/bloc/product_bloc/product_bloc.dart';
import 'package:classico_395/api_exp_395/ui/bloc/quote_bloc/quote_bloc.dart';
import 'package:classico_395/api_exp_395/ui/bloc/recipe_bloc/recipe_bloc.dart';
import 'package:classico_395/api_exp_395/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
   /* BlocProvider(
      create: (context) => RecipeBloc(apiHelper: ApiHelper()),
      child: MyApp(),
  ),*/

    MultiBlocProvider(providers: [
      BlocProvider(create: (context) => RecipeBloc(apiHelper: ApiHelper())),
      BlocProvider(create: (context) => QuoteBloc(apiHelper: ApiHelper())),
      BlocProvider(create: (context) => ProductBloc(apiHelper: ApiHelper())),
    ], child: MyApp())

  // MyApp()
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
      initialRoute: AppRoutes.dashboard,
      routes: AppRoutes.getRoutes(),
    );
  }
}

