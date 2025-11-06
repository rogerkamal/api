import 'package:classico_395/navigation_exp_395/home_page.dart';
import 'package:classico_395/navigation_exp_395/profile_page.dart';
import 'package:classico_395/navigation_exp_395/splash_page.dart';
import 'package:flutter/material.dart';

///This class used only when named navigation is implemented
class AppRoutes{
  static const String SPLASH = "/splash";
  static const String HOMEPAGE  = "/home";
  static const String PROFILEPAGE = "/profile";

  static Map<String,Widget Function(BuildContext)> pageRoutes() =>{
    SPLASH : (_) => SplashPage(),
    HOMEPAGE : (_) => HomePageNavigation(),
    PROFILEPAGE : (_) => ProfilePage(),
  };
}
