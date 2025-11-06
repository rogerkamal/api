import 'package:classico_395/navigation_exp_395/app_routes.dart';
import 'package:classico_395/navigation_exp_395/home_page.dart';
import 'package:classico_395/navigation_exp_395/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const NavigationAppMain());
}

class NavigationAppMain extends StatelessWidget {
  const NavigationAppMain({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation',
      theme: ThemeData(
       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: SplashPage(),

      ///named navigation
      initialRoute: AppRoutes.SPLASH,
      routes: AppRoutes.pageRoutes(),
    );
  }
}

